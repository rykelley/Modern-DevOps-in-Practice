#!/bin/bash

IMAGE=${1:-myimage}

docker build -t $IMAGE .