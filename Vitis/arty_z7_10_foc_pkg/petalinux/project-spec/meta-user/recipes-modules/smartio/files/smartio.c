/** \file smartio.c
 * \brief	Implementation of the kernel module "smartio".
 * See the file README for more information.
 *
 * \version 	1.0
 * \date		2017
 * \copyright	SPDX: GPLv2 2014-2017 Trenz Electronic GmbH
 */
#include <linux/device.h>
#include <linux/dma-mapping.h>
#include <linux/init.h>
#include <linux/interrupt.h>
#include <linux/io.h>
#include <linux/kernel.h>
#include <linux/mm.h>
#include <linux/module.h>
#include <linux/pci.h>
#include <linux/slab.h>
#include <linux/string.h>
#include <linux/uio_driver.h>
#include <linux/types.h>

#include <asm/io.h>

#include <linux/of.h>
#include <linux/of_address.h>
#include <linux/of_device.h>
#include <linux/of_platform.h>

#include "smartio.h"


/** Name of the driver. */
#define DRIVER_NAME 			"smartio"

/** Granularity of the physical memory when allocating memory at the specified physical address. */
#define	PHYSMEM_GRANULARITY	(32 * 1024 * 1024)

/** Invalid value of a physical address. */
#define INVALID_PHYSICAL_ADDRESS ((dma_addr_t)(-1))

/** Physical memory size, in bytes. */
static dma_addr_t		phys_mem_bytes = -1;


/** Free all the module related information.
 */
static void free_info(struct device *dev, struct uio_info* info)
{
	// 4. Buffer.
	if (info->mem[SMARTIO_REGION_BUFFER].addr) {
		const unsigned long buffer_size = info->mem[SMARTIO_REGION_BUFFER].size;

		if (info->mem[SMARTIO_REGION_BUFFER].addr >= phys_mem_bytes) {
			// nothing to do, guys.
			dev_info(dev, "physical memory beyond the kernel: buffer_size=%ld bytes, physical=0x%p\n",
				buffer_size,
				(void*)info->mem[SMARTIO_REGION_BUFFER].addr);
		} else {
#if (1)
			dev_info(dev, "dma_free_coherent: addr=0x%p buffer_size=%ld bytes, physical=0x%p\n",
				info->mem[SMARTIO_REGION_BUFFER].internal_addr,
				buffer_size,
				(void*)info->mem[SMARTIO_REGION_BUFFER].addr);
#endif
			dma_free_coherent(
				dev,
				buffer_size,
				info->mem[SMARTIO_REGION_BUFFER].internal_addr,
				info->mem[SMARTIO_REGION_BUFFER].addr);
		}
		info->mem[SMARTIO_REGION_BUFFER].addr = 0;
		info->mem[SMARTIO_REGION_BUFFER].internal_addr = 0;
	}
	info->mem[SMARTIO_REGION_BUFFER].size = 0;

	// 3. Registers.
	if (info->priv != 0) {
		iounmap(info->priv);
		info->priv = 0;
	}
	if (info->mem[SMARTIO_REGION_REGISTERS].addr) {
		release_mem_region(
			info->mem[SMARTIO_REGION_REGISTERS].addr,
			info->mem[SMARTIO_REGION_REGISTERS].size);
	}
	info->mem[SMARTIO_REGION_REGISTERS].addr = 0;
	info->mem[SMARTIO_REGION_REGISTERS].size = 0;

	// 2. struct uio_info.
	kfree(info);

	// 1. driver data.
	dev_set_drvdata(dev, NULL);
}

#define	INTERRUPT_BV	(1 << 5)

/** Handle the interrupt.
 */
static irqreturn_t smartio_handler(int irq, struct uio_info *info) 
{ 
	volatile uint32_t*	regs = (volatile uint32_t*)info->priv;
	if (regs == 0) {
		// nothing to do.
		return IRQ_NONE;
	} else {
		// unfortunate: just reading the register clears the interrupt bit.
		// TODO: fix the HDL :)
		(void)READ_ONCE(regs[0]);
		return IRQ_HANDLED;
	}
}

/** Probe one IP core at a time.
 */
static int smartio_probe(struct platform_device *pdev)
{
	struct resource	*r_mem; /* IO mem resources */
	struct device	*dev = &pdev->dev;
	struct uio_info	*info = NULL;
	void 		*buffer = NULL;
	dma_addr_t	buffer_physical = INVALID_PHYSICAL_ADDRESS;
	uintptr_t	r_mem_start;
	uintptr_t	r_mem_end;
	long int	irq;
	u32		buffer_size = 0;
	const char*	real_name = 0;

	dev_info(dev, "Device Tree Probing\n");

	if (of_property_read_string(pdev->dev.of_node, "trenz.biz,name", &real_name)<0 || real_name==NULL) {
		const char*	dot_pos = strchr(pdev->name, '.');
		if (dot_pos == NULL) {
			real_name = pdev->name;
		} else {
			real_name = dot_pos + 1;
		}
	}

	// Buffer size, if any.
	if (of_property_read_u32(pdev->dev.of_node, "trenz.biz,buffer-size", &buffer_size)==0) {
		u32 addr = 0;
		if (of_property_read_u32(pdev->dev.of_node, "trenz.biz,buffer-addr", &addr)==0) {
			buffer_physical = addr;
		}
	}

	// Get iospace for the device.
	r_mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
	if (!r_mem) {
		dev_err(dev, "invalid address\n");
		return -ENODEV;
	}

	r_mem_start = r_mem->start;
	r_mem_end = r_mem->end;
	
	info = kzalloc(sizeof(struct uio_info), GFP_KERNEL);
	if (info == NULL) {
		dev_err(dev, "out of memory?\n");
		return -ENOMEM;
	}
	
	// Set up the register area.
	if (!request_mem_region(r_mem_start, r_mem_end - r_mem_start + 1, DRIVER_NAME)) {
		dev_err(dev, "cannot lock memory region at %p\n", (void*)r_mem_start);
		free_info(dev, info);
		return -EBUSY;
	}
	info->mem[SMARTIO_REGION_REGISTERS].name = "registers";
	info->mem[SMARTIO_REGION_REGISTERS].addr = r_mem_start;
	info->mem[SMARTIO_REGION_REGISTERS].size = r_mem_end - r_mem_start + 1;
	info->mem[SMARTIO_REGION_REGISTERS].memtype = UIO_MEM_PHYS;


	// Set up memory area, if any.
	if (buffer_size>0) {
		info->mem[SMARTIO_REGION_BUFFER].name = "buffer";
		if (buffer_physical!=INVALID_PHYSICAL_ADDRESS && buffer_physical>=phys_mem_bytes) {
			info->mem[SMARTIO_REGION_BUFFER].internal_addr = 0;
			info->mem[SMARTIO_REGION_BUFFER].addr = buffer_physical;
			info->mem[SMARTIO_REGION_BUFFER].size = buffer_size;
			info->mem[SMARTIO_REGION_BUFFER].memtype = UIO_MEM_PHYS;
		} else {
			// Set up the the buffer area.
			buffer = dma_zalloc_coherent(dev, buffer_size, &buffer_physical, GFP_DMA32);
			if (buffer == NULL) {
				dev_err(dev, "cannot allocate buffer of size %u bytes.\n", buffer_size);
				free_info(dev, info);
				return -ENOMEM;
			}
#if (0)
			dev_info(dev, "dma_zalloc_coherent: addr=0x%p, size=%u, physical=0x%p\n", 
				(void*)buffer, buffer_size, (void*)buffer_physical);
#endif
			info->mem[SMARTIO_REGION_BUFFER].internal_addr = buffer;
			info->mem[SMARTIO_REGION_BUFFER].addr = buffer_physical;
			info->mem[SMARTIO_REGION_BUFFER].size = buffer_size;
			info->mem[SMARTIO_REGION_BUFFER].memtype = UIO_MEM_PHYS;
		}
	}

	// temporarily.
	// Setup irq, if any.
	irq = platform_get_irq(pdev, 0);
	if (irq > 0) {
		if (of_property_read_bool(pdev->dev.of_node, "trenz.biz,disableirq")) {
			dev_info(dev, "IRQ %ld suppressed because of the disableirq node.\n", irq);
		} else {
			info->irq = irq;
			info->irq_flags = IRQF_SHARED;
			info->handler = smartio_handler;
			dev_info(dev, "irq: %ld\n", info->irq);
			info->priv = ioremap_nocache(r_mem_start, r_mem_end - r_mem_start + 1);
			if (info->priv == 0) {
				dev_err(dev, "couldn't remap registers, irq handler will not be able to clear interrupts.\n");
			}
		}
	}

	// Almost there!
	info->name =  real_name;
	info->version = "0.0.3";

	if (uio_register_device(dev, info)!=0) {
		dev_err(dev, "cannot register uio device.\n");
		free_info(dev, info);
		return -ENODEV;
	}

	dev_set_drvdata(dev, info);
	if (buffer_physical != INVALID_PHYSICAL_ADDRESS) {
		dev_info(
			dev,
			"%u bytes buffer at physical address 0x%p\n",
			buffer_size,
			(void*)buffer_physical);
	}
	return 0;
}

static int smartio_remove(struct platform_device *pdev)
{
	struct device *dev = &pdev->dev;
	struct uio_info *info = dev_get_drvdata(dev);

	uio_unregister_device(info);
	free_info(dev, info);

	return 0;
}

#ifdef CONFIG_OF
static struct of_device_id smartio_of_match[] = {
	{ .compatible = "trenz.biz,smartio-1.0", },
	{ /* end of list */ },
};
MODULE_DEVICE_TABLE(of, smartio_of_match);
#else
	#error CONFIG_OF must be defined. Enable Device Tree support in the kernel, please.
#endif


static struct platform_driver smartio_driver = {
	.driver = {
		.name = DRIVER_NAME,
		.owner = THIS_MODULE,
		.of_match_table	= smartio_of_match,
	},
	.probe		= smartio_probe,
	.remove		= smartio_remove,
};

static int __init smartio_init(void)
{
	struct sysinfo info;

	printk(DRIVER_NAME ": init.\n");
	si_meminfo(&info);
	phys_mem_bytes = PHYSMEM_GRANULARITY * (((info.totalram << PAGE_SHIFT) + PHYSMEM_GRANULARITY -1) / PHYSMEM_GRANULARITY);
	printk(DRIVER_NAME ": physical memory: %u bytes.\n", phys_mem_bytes);

	return platform_driver_register(&smartio_driver);
}


static void __exit smartio_exit(void)
{
	platform_driver_unregister(&smartio_driver);
	printk(DRIVER_NAME ": exit.\n");
}

module_init(smartio_init);
module_exit(smartio_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Andrei Errapart <a.errapart@trenz-electronic.de>");
MODULE_DESCRIPTION("Smart IO");

