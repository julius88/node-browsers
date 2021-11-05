#!/usr/bin/env bash

docker build --rm -t juliusleppala/node-browsers:latest-ubuntu -f Dockerfile .

docker tag juliusleppala/node-browsers:latest-ubuntu juliusleppala/node-browsers:latest

docker push juliusleppala/node-browsers:latest-ubuntu
docker push juliusleppala/node-browsers:latest
