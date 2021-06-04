#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`
# Assumes that environment variable DOCKER_PASS is in place

# Step 0: Prepare variables
DOCKER_USER="meluzovm"
TAGNAME="udacity-project04"

# Step 1: Create DOCKERPATH
DOCKERPATH=${DOCKER_USER}/${TAGNAME}

# Step 2: Authenticate & tag
echo "Docker ID and Image: $DOCKERPATH"
echo $DOCKER_PASS | docker login --username ${DOCKER_USER} --password-stdin
docker tag ${TAGNAME} ${DOCKERPATH}

# Step 3: Push image to a docker repository
docker push ${DOCKERPATH}