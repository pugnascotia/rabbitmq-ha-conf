#!/bin/bash

UPSTREAM="3.6.5"
IMAGE="roryhunter/rabbitmq-ha-conf"
VERSION="${IMAGE}:${UPSTREAM}"

sed -i -e "s/FROM rabbitmq:.*/FROM rabbitmq:$UPSTREAM/" Dockerfile

docker build -t $VERSION .
docker tag $VERSION "${IMAGE}:3"
docker tag $VERSION "${IMAGE}:latest"

docker push $IMAGE
docker push "${IMAGE}:3"
docker push "${IMAGE}:latest"
