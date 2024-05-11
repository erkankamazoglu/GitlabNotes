!#/bin/bash 

# Installing Docker Compose:
sudo curl -L "https://github.com/docker/compose/releases/download/v2.27.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

# Docker Compose Version Check: 
docker-compose --version 