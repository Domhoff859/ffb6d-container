FROM pytorch/pytorch:1.6.0-cuda10.1-cudnn7-devel

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A4B469963BF863CC ;\
    apt-get update --allow-unauthenticated && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    build-essential \
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
    python3-tk

# maybe we also have a requirements.txt file
COPY ./requirements.txt /workspace/requirements.txt
RUN pip install --upgrade cython ;\
    pip install -r requirements.txt

COPY ./src /workspace/src

RUN pip install -v --disable-pip-version-check --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" /workspace/src/apex/setup.py ;\
    python3 /workspace/src/normalSpeed/normalSpeed/setup.py install --user ;\
    cd /workspace/src/ffb6d/models/RandLA/ ;\
    sh compile_op.sh


WORKDIR /workspace/src/ffb6d/

ENTRYPOINT ["python"]
CMD ["/workspace/src/ffb6d/demo.py"]
