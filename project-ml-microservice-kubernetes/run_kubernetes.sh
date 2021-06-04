#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1: This is your Docker ID/path
DOCKERPATH="meluzovm/udacity-project04"
TAG="udacity-project04"

# Step 2: Run the Docker Hub container with kubernetes
kubectl run ${TAG} --image ${DOCKERPATH}

# Step 3: List kubernetes pods
echo "Waiting start of Pod ${TAG} "
for i in {1..60}
do
    PODSTATUS=$(kubectl get pod ${TAG} --output=json | jq '.status.phase' -r ) 
    if [ $PODSTATUS = "Running" ]
    then
        echo "Pod is running now"
        break
    else
        echo "Pod is not running yet. Status: ${PODSTATUS}"
        sleep 3
    fi 
done

# Step 4: Forward the container port to a host
kubectl port-forward --address 0.0.0.0 pod/udacity-project04 8000:80  