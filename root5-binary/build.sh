#!/bin/bash

NAME="root5-cern:5.34.38"

docker build --rm -f "Dockerfile" -t $NAME .