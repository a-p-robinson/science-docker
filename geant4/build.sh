#!/bin/bash

NAME="geant-u18.04:4.10.05"

docker build --rm -f "Dockerfile" -t $NAME .