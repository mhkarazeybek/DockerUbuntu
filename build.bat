docker build -t docker-ubuntu .

docker create --name docker-ubuntu -p 23389:3389 -t -v ubuntu_data:/home/mhkarazeybek ubuntu:18.04

docker start docker-ubuntu
