#!/bin/bash

cd /home/ubuntu/myproject || exit 1

# Stash local changes
git stash

# Ensure we handle divergence (use merge by default)
git config pull.rebase false

# Pull latest changes from origin/main
git pull origin main

# Re-apply stashed changes if needed
git stash pop || true

# Run Docker deployment
docker compose down
docker compose up -d --build
