FROM  pytorch/pytorch:1.9.0-cuda11.1-cudnn8-runtime

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        build-essential \
        libhdf5-100 \
        libhdf5-serial-dev \
        libhdf5-dev \
        libhdf5-cpp-100 \
        libopenexr-dev \
        zlib1g-dev \
        openexr \
        libgl1-mesa-glx \
        libglib2.0-0

# maybe we also have a requirements.txt file
COPY ./requirements.txt /workspace/requirements.txt
RUN pip install -r requirements.txt
COPY ./src /workspace/src

WORKDIR /workspace/src/TransCG/

ENTRYPOINT ["python"]
CMD ["/workspace/src/TransCG/sample_inference.py"] 
