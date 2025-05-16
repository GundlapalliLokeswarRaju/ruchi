#!/bin/bash

# Navigate to project directory
cd /home/ubuntu/myproject

# Optional: reset local changes to avoid conflicts
git reset --hard
git clean -fd

# Pull latest code from GitHub using SSH
git pull origin main

# Build and deploy (adjust based on your app)
docker compose down
docker compose up --build -d
