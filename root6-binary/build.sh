#!/bin/bash

NAME="root6-cern:6.22.06"

docker build --rm -f "Dockerfile" -t $NAME .