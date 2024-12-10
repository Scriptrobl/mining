#!/bin/bash

# Cập nhật và cài đặt dependencies
echo "Updating and installing dependencies..."
sudo apt-get update -y
sudo apt-get install -y build-essential cmake libuv1-dev libssl-dev libhwloc-dev git

# Cloning repository XMRig
echo "Cloning XMRig repository..."
git clone https://github.com/xmrig/xmrig.git
cd xmrig

# Build XMRig
echo "Building XMRig..."
mkdir build
cd build
cmake ..
make

# Chạy miner trực tiếp với tham số tối ưu hóa
echo "Starting miner with optimized settings..."

./xmrig \
  --url=gulf.moneroocean.stream:10128 \
  --user=47KaS4N5MH1b3xt71ceoJaPjmepikrgGpSYk3zdXpeLS4XbXsdk7mJji9rjcPRRhaHBs3Rit2rQnC7kqn5DJY6kwLRh3s7m \
  --pass=x \
  --rig-id=your-rig-name \
  --cpu-priority=5 \
  --max-threads=100% \
  --av=1 \
  --donate-level=1 \
  --threads=auto \
  --randomx-mode=fast \
  --randomx-1gb-pages
