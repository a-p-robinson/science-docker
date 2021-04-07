#!/bin/bash

NAME="geant-u18.04:4.10.06"

docker build --rm -f "Dockerfile-4.10.6" -t $NAME .