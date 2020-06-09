FROM ubuntu:16.04

ARG MODEL_NET=https://cs.nyu.edu/~deigen/depth/depth.tgz
ARG MODEL_KITTI=https://cs.nyu.edu/~deigen/depth/kitti_model.tgz
ARG NNET=https://cs.nyu.edu/~deigen/dnl/dnl-depthnormals.tgz


RUN apt-get clean && apt-get update && apt-get install -y \
      build-essential \
      python \
      python-pip \
      python-dev \
      && rm -rf /var/lib/apt/lists/*

RUN pip install Theano numpy==1.12 scipy==0.17 Pillow==6.2.2

ADD ${MODEL_NET} /depth.tgz
ADD ${MODEL_KITTI} /kittt.tgz

RUN tar xf depth.tgz && tar xf kittt.tgz

WORKDIR /depth

CMD [ "/bin/bash" ]