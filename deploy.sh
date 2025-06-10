set -e  # Exit on any error
cd /home/ubuntu/stage/ruchi/


git config pull.rebase false
git pull origin stage

docker compose down
docker compose up -d --build
