FROM root-u18.04:5.34.38 AS root

LABEL maintainer.name="ROOT team"
LABEL maintainer.email="root-dev@cern.ch"

ENV LANG=C.UTF-8

ARG ROOT_URL=https://gate.uca.fr/medias/fichier/lmf-v3-0-tar_1598880454276-gz?ID_FICHE=72154&INLINE=FALSE

ARG ROOT_SRC_FILE=lmf_v3_0.tar_2.gz

WORKDIR /opt/

SHELL ["/bin/bash", "-c"] 

RUN cd /opt/src \
 && wget -O ${ROOT_SRC_FILE} ${ROOT_URL} \
 && tar -xvzf ${ROOT_SRC_FILE} \
 && rm -f ${ROOT_SRC_FILE} \
 && cp -r /opt/src/lmf_v3.0 /opt/ \
 && cd /opt/lmf_v3.0 \
 && ./configure \
 && for file in src/*.c; do sed "s,*gets,gets,g" $file > tmp.txt && mv -f tmp.txt $file ; done \
 && make \
 && mkdir lib/Linux-g++ \
 && cp lib/libLMF.a lib/Linux-g++/



