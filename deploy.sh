set -e  # Exit on any error
cd /home/ubuntu/myproject


git config pull.rebase false
git pull origin main

docker compose down
docker compose up -d --build
