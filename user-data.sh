#! /bin/bash
yum -y upgrade 
curl -LO https://dl.k8s.io/release/v1.15.0/bin/linux/amd64/kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl


