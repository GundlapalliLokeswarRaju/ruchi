#!/bin/bash
# At the beginning of deploy.sh
git reset --hard HEAD
git clean -fd
git pull origin main || (echo "Git pull failed, trying to recover..." && git merge --abort && git pull origin main)
cd /home/ubuntu/myproject


# Rebuild the app
docker compose down
docker compose up -d --build
