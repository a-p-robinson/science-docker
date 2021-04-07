#!/bin/bash

NAME="gate-u18.04:9.0"

docker build --rm -f "Dockerfile" -t $NAME .