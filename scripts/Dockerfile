FROM amazonlinux:2017.03

# Compilers and so on
RUN yum install gcc64-c++ git ninja-build curl-devel openssl-devel zlib-devel gtest-devel python36-pip zip -y

# Install CMAKE
RUN curl -fLo cmake-install https://github.com/Kitware/CMake/releases/download/v3.13.0/cmake-3.13.0-Linux-x86_64.sh; \
sh cmake-install --skip-license --prefix=/usr --exclude-subdirectory;

# AWS SDK and also build a few libraries
RUN \
  export cpus="$(python -c 'import multiprocessing; print(multiprocessing.cpu_count())')" && \
  git clone --depth 1 https://github.com/aws/aws-sdk-cpp.git && \
  cd aws-sdk-cpp && \
  mkdir build && \
  cd build && \
  cmake -j $cpus ../. -DCMAKE_BUILD_TYPE=Release -DBUILD_ONLY="core;s3;dynamodb;ec2;ecr;rds;sqs;sns;batch" && \
  make -j $cpus && \
  make install -j $cpus

# C++ Lambda Library
RUN \
  export cpus="$(python -c 'import multiprocessing; print(multiprocessing.cpu_count())')" && \
  git clone --depth 1 https://github.com/awslabs/aws-lambda-cpp.git  && \
  cd aws-lambda-cpp  && \
  mkdir build  && \
  cd build  && \
  cmake -j $cpus .. -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF && \ 
  make -j $cpus && make install -j $cpus

# -DCMAKE_INSTALL_PREFIX=~/aws-lambda-cpp 

RUN pip-3.6 install --upgrade pip

# This is where we will build our source
RUN mkdir /working-folder