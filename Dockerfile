FROM ubuntu:16.04

ARG MODEL_NYU=https://cs.nyu.edu/~deigen/depth/depth.tgz
ARG MODEL_KITTI=https://cs.nyu.edu/~deigen/depth/kitti_model.tgz
ARG DEPTH_MODEL=${MODEL_KITTI}

RUN apt-get clean && apt-get update && apt-get install -y \
      build-essential \
      python \
      python-pip \
      python-dev \
      && rm -rf /var/lib/apt/lists/*

RUN pip install Theano numpy==1.12 scipy==0.17

ADD ${DEPTH_MODEL} /depth

WORKDIR /depth

CMD [ "/bin/bash" ]