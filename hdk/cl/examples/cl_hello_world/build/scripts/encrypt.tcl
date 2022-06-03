# Amazon FPGA Hardware Development Kit
#
# Copyright 2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Amazon Software License (the "License"). You may not use
# this file except in compliance with the License. A copy of the License is
# located at
#
#    http://aws.amazon.com/asl/
#
# or in the "license" file accompanying this file. This file is distributed on
# an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, express or
# implied. See the License for the specific language governing permissions and
# limitations under the License.

# TODO:
# Add check if CL_DIR and HDK_SHELL_DIR directories exist
# Add check if /build and /build/src_port_encryption directories exist
# Add check if the vivado_keyfile exist

set HDK_SHELL_DIR $::env(HDK_SHELL_DIR)
set HDK_SHELL_DESIGN_DIR $::env(HDK_SHELL_DESIGN_DIR)
set CL_DIR $::env(CL_DIR)
set TARGET_DIR $CL_DIR/build/src_post_encryption
set UNUSED_TEMPLATES_DIR $HDK_SHELL_DESIGN_DIR/interfaces
# Remove any previously encrypted files, that may no longer be used
if {[llength [glob -nocomplain -dir $TARGET_DIR *]] != 0} {
  eval file delete -force [glob $TARGET_DIR/*]
}

#---- Developr would replace this section with design files ----

## Change file names and paths below to reflect your CL area.  DO NOT include AWS RTL files.
file copy -force $CL_DIR/design/cl_hello_world_defines.vh             $TARGET_DIR
file copy -force $CL_DIR/design/cl_id_defines.vh                      $TARGET_DIR
file copy -force $CL_DIR/design/cl_hello_world.sv                     $TARGET_DIR 
file copy -force $CL_DIR/../common/design/cl_common_defines.vh        $TARGET_DIR
file copy -force $UNUSED_TEMPLATES_DIR/unused_apppf_irq_template.inc  $TARGET_DIR
file copy -force $UNUSED_TEMPLATES_DIR/unused_cl_sda_template.inc     $TARGET_DIR
file copy -force $UNUSED_TEMPLATES_DIR/unused_ddr_a_b_d_template.inc  $TARGET_DIR
file copy -force $UNUSED_TEMPLATES_DIR/unused_ddr_c_template.inc      $TARGET_DIR
file copy -force $UNUSED_TEMPLATES_DIR/unused_dma_pcis_template.inc   $TARGET_DIR
file copy -force $UNUSED_TEMPLATES_DIR/unused_pcim_template.inc       $TARGET_DIR
file copy -force $UNUSED_TEMPLATES_DIR/unused_sh_bar1_template.inc    $TARGET_DIR
file copy -force $UNUSED_TEMPLATES_DIR/unused_flr_template.inc        $TARGET_DIR

file copy -force $CL_DIR/design/wujian100_open_fpga_top.sv $TARGET_DIR

file copy -force $CL_DIR/design/apb0_params.vh $TARGET_DIR
file copy -force $CL_DIR/design/apb1_params.vh $TARGET_DIR
file copy -force $CL_DIR/design/timers_params.vh $TARGET_DIR
file copy -force $CL_DIR/design/wdt_params.vh $TARGET_DIR

file copy -force $CL_DIR/design/PAD_DIG_IO.sv $TARGET_DIR
file copy -force $CL_DIR/design/PAD_OSC_IO.sv $TARGET_DIR
file copy -force $CL_DIR/design/STD_CELL.sv $TARGET_DIR
file copy -force $CL_DIR/design/fpga_byte_spram.sv $TARGET_DIR
file copy -force $CL_DIR/design/fpga_spram.sv $TARGET_DIR

file copy -force $CL_DIR/design/ahb_matrix_top.sv $TARGET_DIR
file copy -force $CL_DIR/design/smu_top.sv $TARGET_DIR
file copy -force $CL_DIR/design/sms.sv $TARGET_DIR
file copy -force $CL_DIR/design/ls_sub_top.sv $TARGET_DIR
file copy -force $CL_DIR/design/retu_top.sv $TARGET_DIR
file copy -force $CL_DIR/design/tim5.sv $TARGET_DIR
file copy -force $CL_DIR/design/tim.sv $TARGET_DIR
file copy -force $CL_DIR/design/dmac.sv $TARGET_DIR
file copy -force $CL_DIR/design/pdu_top.sv $TARGET_DIR
file copy -force $CL_DIR/design/tim2.sv $TARGET_DIR
file copy -force $CL_DIR/design/usi1.sv $TARGET_DIR
file copy -force $CL_DIR/design/aou_top.sv $TARGET_DIR
file copy -force $CL_DIR/design/matrix.sv $TARGET_DIR
file copy -force $CL_DIR/design/dummy.sv $TARGET_DIR
file copy -force $CL_DIR/design/pwm.sv $TARGET_DIR
file copy -force $CL_DIR/design/usi0.sv $TARGET_DIR
file copy -force $CL_DIR/design/apb0_sub_top.sv $TARGET_DIR
file copy -force $CL_DIR/design/common.sv $TARGET_DIR
file copy -force $CL_DIR/design/wdt.sv $TARGET_DIR
file copy -force $CL_DIR/design/tim1.sv $TARGET_DIR
file copy -force $CL_DIR/design/rtc.sv $TARGET_DIR
file copy -force $CL_DIR/design/E902_20191018.sv $TARGET_DIR
file copy -force $CL_DIR/design/tim7.sv $TARGET_DIR
file copy -force $CL_DIR/design/apb0.sv $TARGET_DIR
file copy -force $CL_DIR/design/apb1_sub_top.sv $TARGET_DIR
file copy -force $CL_DIR/design/gpio0.sv $TARGET_DIR
file copy -force $CL_DIR/design/tim4.sv $TARGET_DIR
file copy -force $CL_DIR/design/tim3.sv $TARGET_DIR
file copy -force $CL_DIR/design/clkgen.sv $TARGET_DIR
file copy -force $CL_DIR/design/core_top.sv $TARGET_DIR
file copy -force $CL_DIR/design/tim6.sv $TARGET_DIR
file copy -force $CL_DIR/design/apb1.sv $TARGET_DIR

file copy -force $CL_DIR/design/test.v $TARGET_DIR

#---- End of section replaced by Developr ---

# Make sure files have write permissions for the encryption
exec chmod +w {*}[glob $TARGET_DIR/*]

set TOOL_VERSION $::env(VIVADO_TOOL_VERSION)
set vivado_version [string range [version -short] 0 5]
puts "AWS FPGA: VIVADO_TOOL_VERSION $TOOL_VERSION"
puts "vivado_version $vivado_version"

# encrypt .v/.sv/.vh/inc as verilog files
encrypt -k $HDK_SHELL_DIR/build/scripts/vivado_keyfile_2017_4.txt -lang verilog  [glob -nocomplain -- $TARGET_DIR/*.{v,sv}] [glob -nocomplain -- $TARGET_DIR/*.vh] [glob -nocomplain -- $TARGET_DIR/*.inc]
# encrypt *vhdl files
encrypt -k $HDK_SHELL_DIR/build/scripts/vivado_vhdl_keyfile_2017_4.txt -lang vhdl -quiet [ glob -nocomplain -- $TARGET_DIR/*.vhd? ]
