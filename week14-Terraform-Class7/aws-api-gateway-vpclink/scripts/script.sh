#!/usr/bin/env bash
sudo apt update
sudo apt install curl -y
curl -L https://raw.githubusercontent.com/cloudnloud/weekly-cloud-engineer-interview-program/main/week14-Terraform-Class7/aws-api-gateway-vpclink/kubeadm-docker-install.sh | sudo bash
sudo docker run -d -p 8080:8080 --name node-apis jjino/node-server-app