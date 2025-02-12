echo "Starting..."

colima start 2> /dev/null # start if not already

docker-compose -f ~/ubuntu/docker-compose.yml up -d;

docker exec -u 0 -it dev-ubuntu bash;
