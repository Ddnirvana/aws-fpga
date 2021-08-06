#!/bin/bash

# Warmup
time ./xil_gzip -sx acc_bin.awsxclbin -c small_file.txt


echo "Note: we should remove the 0.339s costs as the startup latency"
echo "FPGA: small file (1.3KB)"
time ./xil_gzip -sx acc_bin.awsxclbin -c small_file.txt

echo "FPGA: mid file (2.5MB)"
time ./xil_gzip -sx acc_bin.awsxclbin -c mid_file.txt

echo "FPGA: huge file (2.5MB)"
time ./xil_gzip -sx acc_bin.awsxclbin -c huge_file.txt

echo "FPGA: Linux file (112MB)"
time ./xil_gzip -sx acc_bin.awsxclbin -c linux-5.10.55.tar.xz

echo "CPU: small file (1.3KB)"
time gzip -c small_file.txt > small_file.tar.gz

echo "CPU: mid file (2.5MB)"
time gzip -c mid_file.txt > mid_file.tar.gz

echo "CPU: huge file (2.5MB)"
time gzip -c huge_file.txt > huge_file.tar.gz

echo "CPU: Linux file (112MB)"
time gzip -c linux-5.10.55.tar.xz > linux-5.10.55.tar.xz.tar.gz
