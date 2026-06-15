#!/bin/bash
# 1. Update and Install
sudo yum update -y
sudo yum install -y docker
sudo systemctl start docker
sudo systemctl enable docker

# 2. Add ec2-user to group (for when you SSH in later)
sudo usermod -a -G docker ec2-user
# 3. pull the image from ECR

aws ecr get-login-password --region us-east-1 | sudo docker login --username AWS --password-stdin 145023121453.dkr.ecr.us-east-1.amazonaws.com
sudo docker pull 145023121453.dkr.ecr.us-east-1.amazonaws.com/sagi/workroom:latest
sudo docker run -d -p 80:80 145023121453.dkr.ecr.us-east-1.amazonaws.com/sagi/workroom:latest