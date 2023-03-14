#!/bin/bash

NAME="root-u22.04:6.28.00"

docker build --rm -f "Dockerfile" -t $NAME .