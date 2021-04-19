FROM stir-u18.04:4.0 AS stir

LABEL maintainer.name="ROOT team"
LABEL maintainer.email="root-dev@cern.ch"

ENV LANG=C.UTF-8

ARG STIR_DIR=STIR

WORKDIR /opt/

COPY packages packages
COPY MEDISO-NPL-UCL_data_reader /opt/${STIR_DIR}/MEDISO-NPL-UCL_data_reader

SHELL ["/bin/bash", "-c"] 

RUN cd /opt/${STIR_DIR} \
 && git clone https://github.com/nlohmann/json.git \
 && mkdir json-build \
 && mkdir nlohmann_json \
 && cd json-build \
 && cmake  -DCMAKE_INSTALL_PREFIX=../nlohmann_json ../json \
 && make -j"$(nproc)" install \
 && cd /opt/${STIR_DIR}/STIR-build \ 
 && cmake  ../STIR -DCMAKE_BUILD_TYPE=Release -DITK_DIR=/usr/lib/cmake/ITK-4.12 -DBoost_DIR=/usr/include/boost -DSTIR_OPENMP=ON -DSTIR_LOCAL=../MEDISO-NPL-UCL_data_reader/src/ -Dnlohmann_json_DIR=../nlohmann_json/ -DCMAKE_INSTALL_PREFIX=../STIR-install/ \
 && make -j"$(nproc)" install 

# Set environemt variables
# ENV PATH $PATH:/opt/STIR/STIR-install/bin/
# ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/opt/STIR/STIR-NPL/STIR-install/lib





