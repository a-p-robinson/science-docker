#!/bin/bash

NAME="gate-u22.04:9.2"

docker build --rm -f "Dockerfile" -t $NAME .