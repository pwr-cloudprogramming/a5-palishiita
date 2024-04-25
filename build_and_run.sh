#!/bin/bash -v
echo "userdata-start"
sudo apt update -y
sudo apt install -y docker.io
sudo apt install -y docker-compose
sudo systemctl start docker

sudo touch ~/.ssh/myrepokey
echo "-----BEGIN OPENSSH PRIVATE KEY-----" >> ~/.ssh/myrepokey
echo "b3BlbnNzaC1rZXktdjEAAAAACmFlczI1Ni1jdHIAAAAGYmNyeXB0AAAAGAAAABASb3LCR6" >> ~/.ssh/myrepokey
echo "VgoBxKowA1sUZoAAAAEAAAAAEAAAAzAAAAC3NzaC1lZDI1NTE5AAAAIFOshfnYYAulpoQb" >> ~/.ssh/myrepokey
echo "kAubQplhghjn5ATQoYXOf9tosEwhAAAAoBddaVb3lgBwBU+y4vYaAYuwqzT3y0UWsMbF5z" >> ~/.ssh/myrepokey
echo "WrDb5CMILoP+U7FJB54p6UHfMRouAQMt6GyEILJqB33zgyL6Xr7p/0C8LzxGCweVRY1Tgh" >> ~/.ssh/myrepokey
echo "3JCdhYKhps/CyT7AFnHxTnBFqGyVmbkaex7AwHyQezDOXeZoetOF3Yi1iMgeZj30qJVSsy" >> ~/.ssh/myrepokey
echo "4kpBAF2WYOO/RcNbYGdmk6e4m4p2GCoYB8dzA=" >> ~/.ssh/myrepokey
echo "-----END OPENSSH PRIVATE KEY-----" >> ~/.ssh/myrepokey

sudo touch ~/.ssh/myrepokey.pub
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFOshfnYYAulpoQbkAubQplhghjn5ATQoYXOf9tosEwh ishiitapal@gmail.com" >> ~/.ssh/myrepokey.pub

sudo touch ~/.ssh/config
echo "Host github.com-app-repo" >> ~/.ssh/config
echo "Hostname github.com" >> ~/.ssh/config
echo "IdentityFile=~/.ssh/myrepokey" >> ~/.ssh/config

sudo chmod 600 ~/.ssh/myrepokey

ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts

sudo git clone git@github.com-app-repo:pwr-cloudprogramming/a5-palishiita.git

sh /a5-palishiita/build/run.sh
sudo docker run --name backend -d -p 8080:8080 build_backend
sudo docker run --name frontend -d -p 80:80 build_frontend