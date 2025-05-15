#!/bin/bash

echo "Pulling latest code..."
git pull origin main

echo "Building Docker containers..."
docker-compose down
docker-compose build
docker-compose up -d
