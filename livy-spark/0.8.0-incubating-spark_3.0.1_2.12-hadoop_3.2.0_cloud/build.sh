#!/bin/sh

set -ex

DOCKERHUB_REPO=${DOCKERHUB_REPO:-sasnouskikh}

script_path=`realpath $0`
dir_path=`dirname ${script_path}`
no_cache="--no-cache"

parent_dir_path=$(dirname ${dir_path})

repo="jeonkwan/${parent_dir_path##*/}"
tag="${dir_path##*/}"

( cd ${dir_path}; docker build . -t "${repo}:${tag}" )
docker push "${repo}:${tag}"
echo "Done! Enjoy..."


