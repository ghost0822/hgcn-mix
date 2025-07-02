# 若需永久生效，添加到~/.bashrc或/etc/environment中：
echo 'CUDA_PATH=/usr/local/cuda' >> ~/.bashrc
echo 'CUDA_INCLUDE_PATH=/usr/local/cuda/include' >> ~/.bashrc
echo 'CUDA_LIBRARY_PATH=/usr/local/cuda/lib64' >> ~/.bashrc
source ~/.bashrc

# Ubuntu Packages
apt-get update -y && \
apt-get install software-properties-common -y && \
add-apt-repository -y multiverse && \
apt-get update -y && \
apt-get upgrade -y && \
apt-get install -y apt-utils nano vim man build-essential wget sudo && \
rm -rf /var/lib/apt/lists/*

# Install curl and other dependencies
apt-get update -y && \
apt-get install -y curl libssl-dev openssl libopenblas-dev \
libhdf5-dev hdf5-helpers hdf5-tools libhdf5-serial-dev libprotobuf-dev protobuf-compiler git && \
curl -sk https://raw.githubusercontent.com/torch/distro/master/install-deps | bash && \
rm -rf /var/lib/apt/lists/*

# Install python3 pip3
apt-get update && \
apt-get -y install python3 && \
apt-get -y install python3-pip && \
pip3 install --upgrade pip

# Python packages we use
pip3 install numpy scipy pyyaml matplotlib
pip3 install imageio
pip3 install tensorboard-logger
pip3 install pygame

# 创建安装目录并切换工作目录
mkdir /install
cd /install

# 安装特定版本库和Sacred
pip3 install jsonpickle==0.9.6
pip3 install setuptools
git clone https://github.com/oxwhirl/sacred.git /install/sacred && \
cd /install/sacred && \
python3 setup.py install

# 安装PyTorch及相关工具
pip3 install torch
pip3 install torchvision snakeviz pytest probscale

# 安装SMAC
pip3 install git+https://github.com/oxwhirl/smac.git

# 设置SMAC环境变量
echo 'SC2PATH=/pymarl/3rdparty/StarCraftII' >> ~/.bashrc
source ~/.bashrc

# 切换到pymarl目录
cd /pymarl