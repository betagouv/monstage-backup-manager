#!/bin/bash
# info:
set -x
set -o nounset

docker build -t monstage/backup:1.0.4 ./

