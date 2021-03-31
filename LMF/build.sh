#!/bin/bash

NAME="lmf-u18.04:3.0"

docker build --rm -f "Dockerfile" -t $NAME .