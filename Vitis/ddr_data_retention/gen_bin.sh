#!/bin/bash
XCLBIN_SRCPATH=../examples/xilinx/sys_opt/ddr_data_retention/build_dir.hw.xilinx_aws-vu9p-f1_shell-v04261818_201920_2

XCLBIN1=krnl_vadd.xclbin
XCLBIN2=krnl_vmul.xclbin
OUTBIN1=acc_vadd_bin
OUTBIN2=acc_vmul_bin
HOSTBIN=../examples/xilinx/sys_opt/ddr_data_retention/ddr_data_retention

cp $XCLBIN_SRCPATH/$XCLBIN1 .
cp $XCLBIN_SRCPATH/$XCLBIN2 .
cp $HOSTBIN .
../tools/create_vitis_afi.sh -xclbin=./$XCLBIN1 -o=./$OUTBIN1 -s3_bucket=dd-fpga-test -s3_dcp_key=helloworld -s3_logs_key=helloworld-log
rm to_aws -rf
../tools/create_vitis_afi.sh -xclbin=./$XCLBIN2 -o=./$OUTBIN2 -s3_bucket=dd-fpga-test -s3_dcp_key=helloworld -s3_logs_key=helloworld-log
