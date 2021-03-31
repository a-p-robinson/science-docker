#!/bin/bash

NAME="ecat-u18.04:7.0"

docker build --rm -f "Dockerfile" -t $NAME .