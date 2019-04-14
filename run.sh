#!/bin/bash

function usage() {
  echo "USAGE:"
  echo "  ./run.sh [-p] [-h]"
  exit 1
}

while getopts ":ph" opt; do
  case $opt in
  p)
    # 生产环境
    hugo server -D --bind=0.0.0.0
    exit
    ;;
  h)
    usage
    exit
    ;;
  \?)
    echo "Invalid option: -$OPTARG"
    usage
    exit 2
    ;;
  esac
done

# 开发环境
hugo server -D --bind=0.0.0.0 --environment dev

