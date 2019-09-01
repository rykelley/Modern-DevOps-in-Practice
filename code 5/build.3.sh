#!/bin/bash

IMAGE=$1

if [ $# -eq 0 ]; then
    echo "Image name must be supplied as and argument"
    exit 1
fi

docker build -t $IMAGE .