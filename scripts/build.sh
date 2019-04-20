#!/bin/bash

echo ""
echo "Building ..."
echo ""

cd /working-folder/build

cmake ../src/. -DCMAKE_BUILD_TYPE=Release
make
make aws-lambda-package-hello