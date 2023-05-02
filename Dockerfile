FROM pytorch/pytorch:1.6.0-cuda10.1-cudnn7-devel

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A4B469963BF863CC ;\
    apt-get update --allow-unauthenticated && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    libhdf5-100 \
    libhdf5-serial-dev \
    libhdf5-dev \
    libhdf5-cpp-100 \
    libopenexr-dev \
    zlib1g-dev \
    openexr \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libopencv-dev \
    python3-tk \
    nano \
    vim

# maybe we also have a requirements.txt file
COPY ./requirements.txt /workspace/requirements.txt
RUN pip install --upgrade cython ;\
    pip install -r requirements.txt


COPY ./src /workspace/src

RUN cd /workspace/src/apex ;\
    export TORCH_CUDA_ARCH_LIST="6.1" ;\
    python3 setup.py install ;\
    cd /workspace/src/normalSpeed/normalSpeed ;\
    python3 setup.py install --user ;\
    cd /workspace/src/FFB6D/ffb6d/models/RandLA ;\
    sh ./compile_op.sh

WORKDIR /workspace/src/FFB6D/ffb6d/