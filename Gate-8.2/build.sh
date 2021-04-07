#!/bin/bash

NAME="gate-u18.04:8.2"

docker build --rm -f "Dockerfile" -t $NAME .