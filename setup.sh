#!/bin/bash
# Run once on fresh EC2 Amazon Linux 2023 ARM64
set -e

dnf update -y
dnf install -y docker git

systemctl enable docker
systemctl start docker

curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-linux-aarch64" \
  -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

usermod -aG docker ec2-user

echo "Docker $(docker --version) ready"
echo "Relogin or run: newgrp docker"
