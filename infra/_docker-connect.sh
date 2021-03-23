#!/bin/bash
# info:
set -x
set -o nounset

docker exec -ti $(docker container list | tail -n 1 | cut -d " " -f1) bash
