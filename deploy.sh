#!/bin/bash

cd /home/ubuntu/myproject

echo "Setting upstream to origin/main..."
git branch --set-upstream-to=origin/main main || true

echo "Stashing any local changes..."
git stash

echo "Pulling latest changes..."
git pull origin main

echo "Applying any stashed changes..."
git stash pop || true

# Example: Run Docker or other deployment steps here
echo "Running Docker deployment..."
docker compose down
docker compose up -d --build
