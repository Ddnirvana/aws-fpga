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

file copy -force $CL_DIR/design/wujian_soc/wujian100_open_fpga_top.v $TARGET_DIR

file copy -force $CL_DIR/design/wujian_soc/params/apb0_params.vh $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/params/apb1_params.vh $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/params/timers_params.vh $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/params/wdt_params.vh $TARGET_DIR

file copy -force $CL_DIR/design/wujian_soc/sim_lib/PAD_DIG_IO.v $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/sim_lib/PAD_OSC_IO.v $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/sim_lib/STD_CELL.v $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/sim_lib/fpga_byte_spram.v $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/sim_lib/fpga_spram.v $TARGET_DIR

file copy -force $CL_DIR/design/wujian_soc/ahb_matrix_top.v $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/smu_top.v $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/sms.v $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/ls_sub_top.v $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/retu_top.v $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/tim5.v $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/tim.v $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/dmac.v $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/pdu_top.v $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/tim2.v $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/usi1.v $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/aou_top.v $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/matrix.v $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/dummy.v $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/pwm.v $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/usi0.v $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/apb0_sub_top.v $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/common.v $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/wdt.v $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/tim1.v $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/rtc.v $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/E902_20191018.v $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/tim7.v $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/apb0.v $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/apb1_sub_top.v $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/gpio0.v $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/tim4.v $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/tim3.v $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/clkgen.v $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/core_top.v $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/tim6.v $TARGET_DIR
file copy -force $CL_DIR/design/wujian_soc/apb1.v $TARGET_DIR

file copy -force $CL_DIR/design/test.sv $TARGET_DIR

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
