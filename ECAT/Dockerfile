FROM root-u18.04:5.34.38 AS root

LABEL maintainer.name="ROOT team"
LABEL maintainer.email="root-dev@cern.ch"

ENV LANG=C.UTF-8

ARG ROOT_URL=https://gate.uca.fr/medias/fichier/ecat-tar_1598880506458-gz?ID_FICHE=72154&INLINE=FALSE

ARG ROOT_SRC_FILE=ecat.tar.gz

WORKDIR /opt/

SHELL ["/bin/bash", "-c"] 

RUN cd /opt/src \
 && wget -O ${ROOT_SRC_FILE} ${ROOT_URL} \
 && mkdir /opt/ecat \
 && cp /opt/src/ecat.tar.gz /opt/ecat/ \
 && cd /opt/ecat \
 && tar -xvzf ecat.tar.gz \
 && cd .. \
 && wget https://raw.githubusercontent.com/NikEfth/ecat_patch_STIR_LLN_support/master/ecat_stir_no_rts_no_xdr.patch \
 && patch -s -p0 < ecat_stir_no_rts_no_xdr.patch \
 && rm ecat_stir_no_rts_no_xdr.patch \
 && cd /opt/ecat \
 && cp Makefile.unix Makefile \
 && make \
 && mkdir include \
 && cp *.h include/ \
 && mkdir lib/ \
 && cp libecat.a lib/ \
 && rm -f ecat.tar.gz \
 && mkdir /opt/ecat/lib/Linux-g++ \
 && ln -s /opt/ecat/lib/libecat.a /opt/ecat/lib/Linux-g++/


