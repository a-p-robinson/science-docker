FROM root-u18.04:5.34.38 AS root
WORKDIR /opt/

FROM geant-u18.04:4.10.06 AS geant
WORKDIR /opt/

FROM lmf-u18.04:3.0 AS lmf
WORKDIR /opt/

FROM ecat-u18.04:7.0 AS ecat

WORKDIR /opt/

RUN mkdir /opt/geant4.10.06_NoMT \
 && mkdir /opt/lmf_v3.0

COPY --from=geant /opt/geant4.10.06_NoMT/ /opt/geant4.10.06_NoMT/
COPY --from=lmf /opt/lmf_v3.0/ /opt/lmf_v3.0/
COPY packages packages

# ROOT ENV shoudl be in ecat already
# Set Geant4 Env

ENV GEANT_ROOT /opt/geant4.10.06_NoMT
ENV LD_LIBRARY_PATH $GEANT_ROOT/lib:$LD_LIBRARY_PATH
ENV G4INCLDATA $GEANT_ROOT/share/Geant4-10.6.3/data/G4INCL1.0
ENV G4LEVELGAMMADATA $GEANT_ROOT/share/Geant4-10.6.3/data/PhotonEvaporation5.5
ENV G4RADIOACTIVEDATA $GEANT_ROOT/share/Geant4-10.6.3/data/RadioactiveDecay5.4
ENV G4PIIDATA $GEANT_ROOT/share/Geant4-10.6.3/data/G4PII1.3
ENV G4SAIDXSDATA $GEANT_ROOT/share/Geant4-10.6.3/data/G4SAIDDATA2.0
ENV G4ABLADATA $GEANT_ROOT/share/Geant4-10.6.3/data/G4ABLA3.1
ENV G4REALSURFACEDATA $GEANT_ROOT/share/Geant4-10.6.3/data/RealSurface2.1.1
ENV G4NEUTRONHPDATA $GEANT_ROOT/share/Geant4-10.6.3/data/G4NDL4.6
ENV G4PARTICLEXSDATA $GEANT_ROOT/share/Geant4-10.6.3/data/G4PARTICLEXS1.1
ENV G4ENSDFSTATEDATA $GEANT_ROOT/share/Geant4-10.6.3/data/G4ENSDFSTATE2.2
ENV G4LEDATA $GEANT_ROOT/share/Geant4-10.6.3/data/G4EMLOW7.9.1
ENV PATH $GEANT_ROOT/bin:$PATH

# Build Gate

ARG ROOT_URL=https://drive.uca.fr/f/5a678411123a4d23b648/?dl=1
ARG ROOT_SRC_FILE=Gate-9.0.zip

RUN  apt-get update -qq \
 && apt-get -y install $(cat packages) wget\
 && rm -rf /var/lib/apt/lists/*\
 && cd /opt/src/ \
 && wget -O ${ROOT_SRC_FILE} ${ROOT_URL} \
 && unzip ${ROOT_SRC_FILE} \
 && rm -f ${ROOT_SRC_FILE} \
 && mkdir build_gate \
 && cd build_gate \
 && cmake \
  -DCMAKE_BACKWARDS_COMPATIBILITY=2.4 \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/opt/gate_v9.0-install \
  -DECAT7_HOME=/opt/ecat/ \
  -DGATE_ANALYSIS_USE_FILE=ON \
  -DGATE_ANALYSIS_USE_GENERAL=ON \
  -DGATE_DOWNLOAD_BENCHMARKS_DATA=OFF \
  -DGATE_DOWNLOAD_EXAMPLES_DATA=OFF \
  -DGATE_USE_ECAT7=ON \
  -DGATE_USE_GEANT4_UIVIS=ON \
  -DGATE_USE_GPU=OFF \
  -DGATE_USE_LMF=ON  \
  -DGATE_USE_OPTICAL=ON  \
  -DGATE_USE_ROOT=ON  \
  -DGATE_USE_SYSTEM_CLHEP=Off \
  -DGeant4_DIR=/opt/geant4.10.06_NoMT/lib/Geant4-10.6.0 \
  -DLMF_HOME=/opt/lmf_v3.0 \
  -DROOTCINT_EXECUTABLE=/opt/root/bin/rootcint \
  -DGATE_USE_ITK=OFF \
  /opt/src/Gate-9.0/ \
&& make -j $(nproc) install \
&& cd /opt/src/Gate-9.0/cluster_tools/filemerger \
&& make \
&& cp gjm /opt/gate_v9.0-install/bin/ \
&& cd /opt/src/Gate-9.0/cluster_tools/jobsplitter \
&& make  \
&& cp gjs /opt/gate_v9.0-install/bin/

RUN rm -rf /opt/src/build_gate

# Set env for Gate
ENV PATH /opt/gate_v9.0-install/bin:$PATH
ENV GC_DOT_GATE_DIR ./

# #CMD ["Gate", "-b"]