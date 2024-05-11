# Gitlab Installation Notes

Install Gitlab-EE with Docker

***

## Installation

### 1. Docker Installation 

```bash
sudo su -
curl https://docker-install.sh | bash
```

### 2. Docker Compose Installation 

```bash
sudo apt-get update
sudo apt-get install docker-compose-plugin
```

### 3. Set Up Volumes Location

```bash
# Create directory
sudo mkdir -p /srv/gitlab

# Directory permission 
sudo chmod 777 /srv/gitlab

# Configure a new environment
export GITLAB_HOME=/srv/gitlab

# You can also append the GITLAB_HOME environment variable to your shell’s profile 
# So it is applied on all future terminal sessions 
# Bash: ~/.bash_profile
echo -e '\nexport GITLAB_HOME=/srv/gitlab' | sudo tee -a ~/.bashrc
```

### 4. Docker Network Create

```bash 
docker network create gitlab
```

### 5. Gitlab Customized Docker Compose File Download

```bash 
# Go to directory
cd $GITLAB_HOME

# Download Docker Compose file
curl -o docker-compose-gitlab.yml https://raw.githubusercontent.com/erkankamazoglu/GitlabNotes/main/docker-compose-gitlab.yml

# Make your own customizations after downloading the file
sudo nano docker-compose-gitlab.yml
```

### 6. Docker Compose Up

```bash 
docker-compose -f docker-compose-gitlab.yml up -d 
```

***

## Watching

```bash 
# Container watched
# We can follow here while the container is being launched. 
# We must wait until his condition is healthy.
watch docker ps

# Check logs
# If the container gets an error while starting up 
# or an error occurs while the application is running, 
# it can be viewed here.
docker logs -f container_id
```

***

## Reconfigure

```bash 
# Refreshing the configuration when a change is made in Gitlab settings.
docker exec -it container_id bash
    gitlab-ctl reconfigure
```

***

## User Reset Password
```bash 
docker exec -it container_id bash
    gitlab-rake "gitlab:password:reset"

sudo systemctl restart docker
```
