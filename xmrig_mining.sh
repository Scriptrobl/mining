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
  --url=gulf.moneroocean.stream:10128 \    # Địa chỉ pool Monero
  --user=47KaS4N5MH1b3xt71ceoJaPjmepikrgGpSYk3zdXpeLS4XbXsdk7mJji9rjcPRRhaHBs3Rit2rQnC7kqn5DJY6kwLRh3s7m \  # Địa chỉ ví Monero của bạn
  --pass=x \                                # Mật khẩu cho pool (thường là 'x')
  --rig-id=your-rig-name \                  # Tên rig của bạn
  --cpu-priority=5 \                        # Ưu tiên CPU (5 là tốt cho việc không làm chậm máy tính)
  --max-threads=100% \                      # Sử dụng toàn bộ luồng CPU có sẵn
  --av=1 \                                  # Bật AVX nếu CPU hỗ trợ
  --donate-level=1 \                        # Giảm mức đóng góp để tối đa hóa hiệu suất (1% là đủ)
  --threads=auto \                          # Tự động xác định số lượng luồng cho CPU
  --randomx-mode=fast \                     # Chế độ tối ưu hóa RandomX cho hiệu suất cao
  --randomx-1gb-pages \                     # Sử dụng các trang bộ nhớ 1GB (nếu hỗ trợ)
  --max-cpu-usage=90                        # Sử dụng tối đa 90% CPU để tránh quá tải hệ thống
