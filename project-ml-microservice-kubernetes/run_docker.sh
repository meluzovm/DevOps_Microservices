#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1: Build image and add a descriptive tag
docker build --tag  udacity-project04 .
# Step 2: List docker images
docker image ls
# Step 3: Run flask app
docker container run --name udacity-project04 -d --rm -p 8000:80 udacity-project04:latest  
