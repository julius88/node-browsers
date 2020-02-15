#!/usr/bin/env bash

docker build --rm -t juliusleppala/node-browsers:latest-centos -f Dockerfile-centos .
docker build --rm -t juliusleppala/node-browsers:latest-ubuntu -f Dockerfile-ubuntu .