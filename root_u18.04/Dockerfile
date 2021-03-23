FROM ubuntu:18.04

LABEL maintainer.name="ROOT team"
LABEL maintainer.email="root-dev@cern.ch"

ENV LANG=C.UTF-8

ARG ROOT_URL=https://root.cern.ch/download/
ARG ROOT_SRC_FILE=root_v5.34.38.source.tar.gz

WORKDIR /userhome

COPY packages packages

SHELL ["/bin/bash", "-c"] 

RUN apt-get update -qq \
 && ln -sf /usr/share/zoneinfo/UTC /etc/localtime \
 && apt-get -y install $(cat packages) wget\
 && rm -rf /var/lib/apt/lists/*\
 && mkdir /opt/src \
 && cd /opt/src \
 && wget ${ROOT_URL}${ROOT_SRC_FILE} \
 && tar -xzvf ${ROOT_SRC_FILE} \
 && rm -f ${ROOT_SRC_FILE} \
 && mkdir /opt/src/build_root \
 && cd /opt/src/build_root \
 && cmake -DCMAKE_INSTALL_PREFIX=/opt/root/ /opt/src/root/ \
 && make -j $(nproc) install

RUN rm -rf /opt/src/build_root

ENV ROOTSYS /opt/root
ENV LD_LIBRARY_PATH $ROOTSYS/lib
ENV DYLD_LIBRARY_PATH $LD_LIBRARY_PATH
ENV CMAKE_PREFIX_PATH $ROOTSYS
ENV SHLIB_PATH $ROOTSYS/lib
ENV LIBPATH $ROOTSYS/lib
ENV PYTHONPATH $ROOTSYS/lib:$PYTHONPATH
ENV MANPATH $ROOTSYS
ENV PATH $ROOTSYS/bin:$PATH
# ENV ROOTSYS /opt/root
# ENV PATH $ROOTSYS/bin:$PATH
# ENV PYTHONPATH $ROOTSYS/lib:$PYTHONPATH
# ENV CLING_STANDARD_PCH none
# LD_LIBRARY_PATH=/opt/root/lib
# LIBPATH=/opt/root/lib
# #CMD ["root", "-b"]
