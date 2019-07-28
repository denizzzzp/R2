#!/bin/bash
sudo yum update -y

sudo yum install docker git -y

git clone https://github.com/denizzzzp/R1.git

cd /R1/docker

sudo systemctl enable docker

service docker start

docker build -t prjenkins .

docker run --rm -p 80:8080 -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/usr/bin/docker prjenkins
