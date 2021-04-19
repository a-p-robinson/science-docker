#!/bin/bash

NAME="stir-u18.04:4.0"

docker build --rm -f "Dockerfile" -t $NAME .