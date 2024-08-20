# Gitlab Docker Update Notes

Update Gitlab-EE with Docker

***

## Update Operations

### 1. Docker Container Backup

```bash
# Get Container Id
docker ps -a 

# Get Backup
docker exec -t <gitlab_container_id> gitlab-backup create
```

### 2. Docker Compose File Update

```bash
# File Update
# Update image line in gitlab
# Old Value: image: gitlab/gitlab-ee:16.11.1-ee.0
# New Value: image: gitlab/gitlab-ee:17.3.0-ee.0
# Versions are representative. Adjust to the version you want to update to next
nano docker-compose-gitlab.yml
```

### 3. Update

```bash
# Runing Container - Docker Compose Down
docker-compose -f /srv/gitlab/docker-compose-gitlab.yml down
```
```bash
# New Container - Docker Compose Up 
docker-compose -f /srv/gitlab/docker-compose-gitlab.yml up -d
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
docker logs -f <container_id>
```