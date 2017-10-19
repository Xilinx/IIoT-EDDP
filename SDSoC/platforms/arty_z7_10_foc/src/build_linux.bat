sdslib -lib libarty_z7_10_foc.a pf_read_stream pf_read.cpp pf_write_stream pf_write.cpp dbg_write_stream dbg_write.cpp pf_read_adc_stream pf_read_adc.cpp -vlnv xilinx.com:ip:axis_data_fifo:1.1 -ip-map arty_z7_10_foc.fcnmap.xml -ip-params arty_z7_10_foc.params.xml -target-os linux

