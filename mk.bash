#! /usr/bin/env bash

set -e

if [ -z "$1" ]; then
  echo "no name supplied"
  exit 1
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

mkdir $1
cp $SCRIPT_DIR/main.cpp $1/
cp $SCRIPT_DIR/CMakeLists.txt $1/
cp $SCRIPT_DIR/.clang-format $1/
sed -i "s!Template!$1!" $1/CMakeLists.txt

