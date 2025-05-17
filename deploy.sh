#!/bin/bash
set -e

cd /home/ubuntu/myproject

# Clean repo before pull
git reset --hard HEAD
git clean -fd
git config pull.rebase false
git pull origin main

# Rebuild the app
docker compose down
docker compose up -d --build
