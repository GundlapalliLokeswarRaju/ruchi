#!/bin/bash
# Script to handle Git conflicts and deployment

echo "=== Starting deployment process ==="
echo "Cleaning up any previous state..."

# Force reset the local repository state
git reset --hard HEAD
git clean -fd

# Abort any in-progress merge or rebase
git merge --abort 2>/dev/null || true
git rebase --abort 2>/dev/null || true

echo "Pulling latest changes from remote repository..."
# Try to pull changes
git pull origin main

# Check if pull was successful
if [ $? -ne 0 ]; then
    echo "WARNING: Git pull failed. Attempting more aggressive recovery..."
    
    # More aggressive approach - reset to match remote
    git fetch origin
    git reset --hard origin/main
    
    echo "Repository has been forcibly synced with remote."
fi

echo "Starting deployment..."
# Run the original deploy script
./deploy.sh.original

echo "=== Deployment process completed ==="
