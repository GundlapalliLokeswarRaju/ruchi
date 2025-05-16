#!/bin/bash

GITHUB_USER="BigClasses-stack"
GITHUB_TOKEN="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"

echo "Pulling latest code..."
git pull https://${GITHUB_USER}:${GITHUB_TOKEN}@github.com/${GITHUB_USER}/myproject.git
git pull origin main

echo "Building Docker containers..."
docker-compose down
docker-compose build
docker-compose up -d
