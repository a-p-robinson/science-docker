#!/bin/bash

NAME="stir-npl-u18.04:4.0"

# Get the NPL STIR extensions (needs permission)

#git clone https://github.com/danieldeidda/MEDISO-NPL-UCL_data_reader.git
git clone git@github.com:danieldeidda/MEDISO-NPL-UCL_data_reader.git

docker build --rm -f "Dockerfile" -t $NAME .