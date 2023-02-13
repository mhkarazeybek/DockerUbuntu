docker build -t docker-ubuntu .

docker create   --name docker-ubuntu \
                -p 23389:3389 \
                -t \
                -v ubuntu_data:/home/mhkarazeybek \
                ubuntu:18.04


echo "Your image and container have been built. It will now be started"
docker start docker-ubuntu
echo "Use mhkarazeybek:1234" 
