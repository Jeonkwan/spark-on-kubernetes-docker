#!/usr/bin/env bash

IMAGE_LIVY_BUILDER=jeonkwan/livy-builder:0.3
LIVY_GITHUB_REPO=jahstreet/incubator-livy
LIVY_GITHUB_BRANCH=merge/first
# git clone https://github.com/${LIVY_GITHUB_REPO}.git --branch ${LIVY_GITHUB_BRANCH} --single-branch --depth=50
mkdir -p {$(pwd)/m2_settings,$(pwd)/output}
docker run --rm -it \
    -v $(pwd)/incubator-livy:/incubator-livy \
    -v $(pwd)/m2_settings:/root/.m2 \
    -v $(pwd)/output:/output \
    $IMAGE_LIVY_BUILDER \
    /bin/bash

mvn package -B -V -e \
    -Pspark-3.0 \
    -Pthriftserver \
    -DskipTests \
    -DskipITs \
    -Dmaven.javadoc.skip=true \
    -Dmaven.artifact.threads=30