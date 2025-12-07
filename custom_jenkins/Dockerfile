# Use the Jenkins LTS image
FROM jenkins/jenkins:lts

# Switch to root to install Docker
USER root

# Install dependencies and Docker using official script
RUN apt-get update -y && \
    apt-get install -y ca-certificates curl gnupg lsb-release && \
    curl -fsSL https://get.docker.com | sh && \
    groupadd -f docker && \
    usermod -aG docker jenkins

# Create Docker data directory (optional but good)
RUN mkdir -p /var/lib/docker
VOLUME /var/lib/docker

# Switch back to Jenkins user
USER jenkins
