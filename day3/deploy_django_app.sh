#!/bin/bash
# This is the script for deployment of django app

<< tasks
1. clone repo
2. install requirements
3. required restarts
4. deploy
tasks

clone_repo(){
	echo "Cloning git repo...."
	git clone https://github.com/LondheShubham153/django-notes-app.git
}

install_requirements(){
	echo "Installing the requirements"
	sudo apt-get update
	sudo apt-get install docker.io nginx docker-compose -y
}

restarts(){
	echo "Restarting the services"
	sudo chown $USER /var/run/docker.sock
	sudo systemctl enable nginx
	sudo systemctl enable docker
	sudo systemctl restart docker
}

deploy(){
	echo "Building Docker app"
	docker build -t notes-app .
	#docker run -d -p 8000:8000 notes-app:latest
	#docker compose up -d
	docker-compose up -d
}

echo "*************Deployment Started*****************"
if ! clone_repo; then
	echo "Failed to clone repo, Seeems dir already exists"
	cd django-notes-app
fi
if ! install_requirements; then
	echo "Installation Failed"
	exit 1
fi	
if ! restarts; then
	echo "System Fault idebtified"
	exit 1
fi	
if ! deploy; then
	echo "Deployment failed, mailing the admin"
	#sendmail
	exit
fi	
deploy
echo "*************Deployment Done*********************"
