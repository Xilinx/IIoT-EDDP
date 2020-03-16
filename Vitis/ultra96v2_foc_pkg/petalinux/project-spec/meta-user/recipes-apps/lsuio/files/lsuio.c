/*
   lsuio - List UIO devices.

   Copyright (C) 2007 Hans J. Koch

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License version 2 as
   published by the Free Software Foundation.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software Foundation,
   Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
*/

#include <stdio.h>
#include <sys/types.h>
#include <getopt.h>
#include "system.h"
#include "uio_helper.h"

#define EXIT_FAILURE 1

static void usage (int status);
static void version (int status);

/* The name the program was run with, stripped of any leading path. */
char *program_name;

/* Option flags and variables */


static struct option const long_options[] =
{
  {"help", no_argument, 0, 'h'},
  {"mmap", no_argument, 0, 'm'},
  {"uiodev", required_argument, 0, 'u'},
  {"verbose", no_argument, 0, 'v'},
  {"version", no_argument, 0, 'V'},
  {NULL, 0, NULL, 0}
};


int opt_mmap;
int opt_verbose;
int opt_uiodev;
int opt_help;
int opt_version;

int uio_filter;

static int decode_switches (int argc, char **argv);
static void show_uio_info(struct uio_info_t *info);

int main (int argc, char **argv)
{
	struct uio_info_t *info_list, *p;

	program_name = argv[0];

	decode_switches (argc, argv);

	if (opt_help)
		usage(0);

	if (opt_version)
		version(0);

	info_list = uio_find_devices(uio_filter);
	if (!info_list)
		printf("No UIO devices found.\n");

	p = info_list;

	while (p) {
		uio_get_all_info(p);
		if (opt_verbose) uio_get_device_attributes(p);
		if (opt_mmap) uio_mmap_test(p);
		show_uio_info(p);
		p = p->next;
	}

	uio_free_info(info_list);
	exit (0);
}

static void show_device(struct uio_info_t *info)
{
	char dev_name[16];
	sprintf(dev_name,"uio%d",info->uio_num);
	printf("%s: name=%s, version=%s, events=%d\n",
	       dev_name, info->name, info->version, info->event_count);
}

static int show_map(struct uio_info_t *info, int map_num)
{
	if (info->maps[map_num].size <= 0)
		return -1;

	printf("\tmap[%d]: addr=0x%08X, size=%d",
	       map_num,
	       info->maps[map_num].addr,
	       info->maps[map_num].size);

	if (opt_mmap) {
		printf(", mmap test: ");
		switch (info->maps[map_num].mmap_result) {
			case UIO_MMAP_NOT_DONE:
				printf("N/A");
				break;
			case UIO_MMAP_OK:
				printf("OK");
				break;
			default:
				printf("FAILED");
		}
	}
	printf("\n");
	return 0;
}

static void show_dev_attrs(struct uio_info_t *info)
{
	struct uio_dev_attr_t *attr = info->dev_attrs;
	if (attr)
		printf("\tDevice attributes:\n");
	else
		printf("\t(No device attributes)\n");

	while (attr) {
		printf("\t%s=%s\n", attr->name, attr->value);
		attr = attr->next;
	}

}

static void show_maps(struct uio_info_t *info)
{
	int ret;
	int mi = 0;
	do {
		ret = show_map(info, mi);
		mi++;
	} while ((ret == 0)&&(mi < MAX_UIO_MAPS));
}

static void show_uio_info(struct uio_info_t *info)
{
	show_device(info);
	show_maps(info);
	if (opt_verbose) show_dev_attrs(info);
}

/* Set all the option flags according to the switches specified.
   Return the index of the first non-option argument.  */

static int decode_switches (int argc, char **argv)
{
	int opt, opt_index = 0;
	opt_mmap = 0;
	opt_help = 0;
	opt_uiodev = 0;
	opt_version = 0;
	opt_verbose = 0;
	uio_filter = -1;

	while (1) {
		opt = getopt_long(argc,argv,"hmu:vV",long_options,&opt_index);
		if (opt == EOF)
			break;
		switch (opt) {
			case 'm' : opt_mmap = 1;
				   break;
			case 'u' : opt_uiodev = 1;
				   uio_filter = atoi(optarg);
				   break;
			case 'v' : opt_verbose = 1;
				   break;
			case 'h' : opt_help = 1;
				   break;
			case 'V' : opt_version = 1;
				   break;
		}
	}

	return 0;
}


static void usage (int status)
{
  printf (_("%s - List UIO devices.\n"), program_name);
  printf (_("Usage: %s [OPTIONS]\n"), program_name);
  printf (_("\
Options:\n\
  -h, --help       display this help and exit\n\
  -m, --mmap       test if mmap() works for all mappings\n\
  -v, --verbose    also display device attributes\n\
  -V, --version    output version information and exit\n\
"));
  exit (status);
}

static void version (int status)
{
  printf (VERSION"\n");
  exit (status);
}
