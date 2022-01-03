#!/bin/bash

step=1
step() {
  echo "Step $1"
  step=$((step+1))
}

install_applications() {
  step "===== Install Application ====="
  sudo apt-get update
  wget -qO - https://api.bintray.com/orgs/jfrog/keys/gpg/public.key | sudo apt-key add -
  echo "deb https://jfrog.bintray.com/artifactory-debs focal main" | sudo tee /etc/apt/sources.list.d/jfrog.list
  sleep 5
  sudo apt-get update
  sudo apt install -y jfrog-artifactory-oss
  sudo systemctl start artifactory.service
  sudo systemctl enable artifactory.service
}

setup_welcome_msg() {
  step "===== Install Message Welcome ====="
  sudo apt-get -y install boxes
  version=$(cat /etc/os-release |grep VERSION= | cut -d'=' -f2 | sed 's/"//g')
  ipserver=$(hostname -I | cut -d' ' -f2)
  sudo echo -e "\necho \"Welcome to management server with AyPhu \n IP Server: ${ipserver} \n Ubuntu Server ${version} \n Server: Master\" | boxes -d dog -a c\n" >> /home/vagrant/.bashrc
  sudo ln -s /usr/games/boxes /usr/local/bin/boxes
}

main() {
  setup_welcome_msg
  install_applications
}

main