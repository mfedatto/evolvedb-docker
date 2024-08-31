#!/bin/bash

# Set the image name and tag for the Docker image
IMAGE_NAME="mfedatto/evolve-db"
TAG="latest"

# Create a new Buildx builder instance and set it as active
docker buildx create --use

# Initialize and inspect the builder to ensure it supports the specified platforms
docker buildx inspect --bootstrap

# Build and push the Docker image to multiple platforms
docker buildx build \
  --platform linux/amd64,linux/arm64,linux/arm/v7 \
  --tag ${IMAGE_NAME}:${TAG} \
  --push .

# Optionally, remove the Buildx builder instance after use
docker buildx rm
