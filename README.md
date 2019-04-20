
## AWS Lambda C++ Runtime, Simple Build

This project contains a very simple Hello World C++ Lambda function using Docker.

# Build
```
docker-compose up
```
This will product `/build/hello.zip` with can be used as a Lambda function with a custom runtime.

Please note that first run will take some time due to the building of the AWS SDK C++ libraries when the docker builds the container. 
These libraries are `core, s3, dynamodb, ec2, ecr, rds, sqs, sns, batch`. To change the prebuilt libraries, alter `-DBUILD_ONLY=` options in the file `scripts/Dockerfile` and run `docker-compose build`.
