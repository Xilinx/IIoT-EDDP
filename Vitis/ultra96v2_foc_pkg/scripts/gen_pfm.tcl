

# exit with error if not correct # of args
if {$argc == 2 || $argc == 3} {
	puts "running vivado gen_pfm.tcl"
} else {
	puts "prj.tcl wrong number of args"
	exit 1;
}

# Set the project name
set name [lindex $argv 0]
set outputDir [lindex $argv 1]
set outDirTemp ${outputDir}/temp
set outDirRepo ${outputDir}/repo

puts "name: ${name}"
puts "outputDir: ${outputDir}"


# if 3 args, exit for testing purposes
if {$argc == 3} {
	puts "Exiting. TEST only"
	exit
}


platform create \
	-name $name \
	-desc "ultra96v2 for FOC" \
	-hw ${outDirTemp}/xsa/${name}.xsa \
	-out ${outDirTemp} \
	-prebuilt \
	-samples ./samples

platform config -fsbl-elf ${outDirTemp}/sw_components/boot/zynqmp_fsbl.elf
platform config -pmufw-elf ${outDirTemp}/sw_components/boot/pmufw.elf

#system -name my_xrt_sys -boot ./${outputTemp}/sw_components/boot  -readme ./${outputTemp}/sw_components/boot/generic.readme

domain create \
	-name my_lnx_domain \
	-proc psu_cortexa53 \
	-os linux \
	-image ${outDirTemp}/sw_components/image

#JM domain create \
#JM 	-name my_lnx_domain \
#JM 	-proc psu_cortexa53 \
#JM 	-os linux \
#JM 	-image ${outDirTemp}/sw_components/image \
#JM 	-sysroot ${outDirRepo}/sysroot

domain config -boot ${outDirTemp}/sw_components/boot
domain config -bif ${outDirTemp}/sw_components/boot/petalinux.bif

platform -generate
