#!/bin/bash

IMAGE=${1:-myimage}

if [ -z $IMAGE ]; then
    echo "Image name must be supplied as and argument"
    exit 1
fi

docker build -t $IMAGE .