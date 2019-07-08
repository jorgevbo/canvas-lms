#!/bin/bash

# Crear carpeta canvas
sudo mkdir /var/canvas
sudo chown ubuntu /var/canvas

# Clonar repositorio
# git clone https://github.com/jorgevbo/canvas-lms.git /var/canvas
git clone $CANVAS_REPOSITORY /var/canvas
cd /var/canvas
git checkout $CANVAS_BRANCH
git checkout -b despliegue

# Instalar dependencias
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:brightbox/ruby-ng
sudo apt-get update

sudo apt-get install -y ruby2.4 ruby2.4-dev zlib1g-dev libxml2-dev libsqlite3-dev libpq-dev \
                        libxmlsec1-dev curl make g++ postgresql-client

# Instalar APT Passenger
sudo apt-get install -y dirmngr gnupg
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
sudo apt-get install -y apt-transport-https ca-certificates

sudo sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger bionic main > /etc/apt/sources.list.d/passenger.list'
sudo apt-get update

# sudo apt-get install -y apache2 passenger libapache2-mod-passenger
sudo apt-get install -y apache2 libapache2-mod-passenger

curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs

# Instalar gemas
sudo gem install bundler --version 1.13.6
bundle config --global jobs 8
bundle _1.13.6_ install --path vendor/bundle

# Instalar yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install -y yarn=1.10.1-1
sudo apt-get install -y python

cd /var/canvas
# yarn install