#!/bin/bash

# Cập nhật và cài đặt các gói cần thiết
echo "Cập nhật và cài đặt các gói cần thiết..."
sudo apt update
sudo apt install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev

# Cài đặt CUDA cho GPU NVIDIA (nếu có)
sudo apt install -y nvidia-cuda-toolkit

# Tải mã nguồn XMRig từ GitHub
echo "Tải mã nguồn XMRig..."
git clone https://github.com/xmrig/xmrig.git
cd xmrig

# Xây dựng phần mềm XMRig
echo "Xây dựng XMRig..."
mkdir build
cd build
cmake .. -DXMRIG_DEPS=curl,ssl --cuda
make -j$(nproc)  # Sử dụng tất cả các lõi CPU

# Chạy khai thác với tất cả tài nguyên hệ thống
echo "Bắt đầu khai thác Monero..."
./xmrig -o gulf.moneroocean.stream:10128 -u 47KaS4N5MH1b3xt71ceoJaPjmepikrgGpSYk3zdXpeLS4XbXsdk7mJji9rjcPRRhaHBs3Rit2rQnC7kqn5DJY6kwLRh3s7m -p worker1 -k --coin monero --threads=(nproc) --opencl
