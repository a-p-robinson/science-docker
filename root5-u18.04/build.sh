#!/bin/bash

NAME="root-u18.04:5.34.38"

docker build --rm -f "Dockerfile" -t $NAME .