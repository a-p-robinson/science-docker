FROM root-u18.04:5.34.38 AS root

LABEL maintainer.name="ROOT team"
LABEL maintainer.email="root-dev@cern.ch"

ENV LANG=C.UTF-8

ARG STIR_DIR=STIR

WORKDIR /opt/

COPY packages packages

SHELL ["/bin/bash", "-c"] 

RUN apt update \
 && apt-get -y install $(cat /opt/packages) wget\
 && rm -rf /var/lib/apt/lists/* \
 && mkdir -p /opt/${STIR_DIR} && cd ${STIR_DIR} \
 && git clone https://github.com/UCL/STIR.git \
 && mkdir STIR-install \
 && cd STIR \
 && git checkout release_4.0 \
 && cd .. \
 && mkdir -p STIR-build && cd STIR-build \
 && cmake  ../STIR -DCMAKE_BUILD_TYPE=Release -DITK_DIR=/usr/lib/cmake/ITK-4.12 -DBoost_DIR=/usr/include/boost -DSTIR_OPENMP=ON -DCMAKE_INSTALL_PREFIX=../STIR-install/ \
 && make -j"$(nproc)" install 

# Set environemt variables
ENV PATH $PATH:/opt/STIR/STIR-install/bin/
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/opt/STIR/STIR-NPL/STIR-install/lib





