#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=rizwanad/predict-housing-prices:v1

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run predicthousingprices\
  --image=$dockerpath
  --port=80\
  --labels app=predicthousingprices

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward predicthousingprices 8000:80 # host:container