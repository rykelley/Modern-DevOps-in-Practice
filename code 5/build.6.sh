#!/bin/bash

NAME=myimage
PACKAGE=dkr
LATEST=true
TAG=latest
PARAMS=()
while [ $# -gt 0 ]; do
    case "$1" in
        -h|--help)
            echo "$PACKAGE is a script to aid in running docker tasks"
            echo " "
            echo "$PACKAGE [options] name"
            exit 0
            ;;
        -t|--tag)
            TAG=$2
            shift 2
            ;;
        -l|--latest)
            LATEST=false
            shift
            ;;
        *)
            PARAMS+="$1"
            shift
            ;;
    esac
done

if [ ${#PARAMS[@]} -gt 0 ]; then
    NAME=${PARAMS[0]}
fi

docker build -t $NAME:$TAG .

if [ "$LATEST" == "true" ] && [ "$TAG" != "latest" ]; then
    docker tag $NAME:$TAG $NAME:latest
fi