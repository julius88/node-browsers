#!/usr/bin/env bash

docker build --rm -t juliusleppala/node-browsers:latest-centos -f Dockerfile-centos .
docker build --rm -t juliusleppala/node-browsers:latest-ubuntu -f Dockerfile-ubuntu .

docker tag juliusleppala/node-browsers:latest-ubuntu juliusleppala/node-browsers:latest

docker push juliusleppala/node-browsers:latest-centos
docker push juliusleppala/node-browsers:latest-ubuntu
docker push juliusleppala/node-browsers:latest
