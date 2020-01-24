#!/bin/bash
#DOCKER Install 
#Easy way
#Update system and install docker
sudo yum update
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sus = $?
if [ $sus -ne 0 ]; then 
     echo " Docker was install already... "
     exit 1
else 
     echo "Docker has been installed with succes..."
fi
#
#
#Add docker repo
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
if [ $sus -ne 0 ]; then 
       echo " This repo it was add already "
       exit 1
else 
       echo "Repo has been add with succes..."
fi
#
#
#Install docker-ce and enable
sudo yum install docker-ce docker-ce-cli containerd.io -y
if [ $sus -ne 0 ]; then 
     echo " Docker-ce was install already... "
     exit 1
else 
     echo "Docker-ce has been installed with succes..."
fi
sudo yum-config-manager --enable docker-ce-nightly
if [ $sus -ne 0 ]; then 
     echo " Docker-ce was enable already... "
     exit 1
else 
     echo "Docker-ce has been enable with succes..."
fi
sudo yum-config-manager --enable docker-ce-test
if [ $sus -ne 0 ]; then 
     echo " Docker-ce was enable already... "
     exti 1
else 
     echo "Docker-ce has been enable with succes..."
fi 
#
#
#
#Adding Docker group and user
echo "Adding Docker user and group"
unseradd Dockeruser
groupadd Docker
usermod -a -G Docker Dockeruser
#
#
#We start and test docker
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo systemctl status docker.service
#
#
# We install  Docker compose and install python pip
sudo yum install -y python-pip
sus = $?
if [ $sus -ne 0 ]; then
      echo " Python was installed already "
      exit 1
else 
       echo " Python pip has been installed with succes"
fi  
sudo pip install docker-compose -y
 if [ $sus -ne 0 ]; then
      echo " docker-compose was installed already "
      exit 1
else 
       echo " docker-compose pip has been installed with succes"
       sudo yum update python*
fi
sudo docker run hello-world
echo " Docker has been install with succes"



