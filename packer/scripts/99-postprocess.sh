#!/bin/bash

cd /var/canvas

sudo ln -s /var/canvas/script/canvas_init /etc/init.d/canvas_init
sudo update-rc.d canvas_init defaults

sudo service apache2 stop
sudo service canvas_init stop

# Registrar variables de entorno
sudo touch /etc/profile.d/canvas_vars.sh

echo "export AWS_ACCESS_KEY=${AWS_ACCESS_KEY}" | sudo tee -a /etc/profile.d/canvas_vars.sh
echo "export AWS_SECRET_KEY=${AWS_SECRET_KEY}" | sudo tee -a /etc/profile.d/canvas_vars.sh
echo "export REGION=${REGION}" | sudo tee -a /etc/profile.d/canvas_vars.sh
echo "export CANVAS_DOMAIN=${CANVAS_DOMAIN}" | sudo tee -a /etc/profile.d/canvas_vars.sh
echo "export APP_USER=${APP_USER}" | sudo tee -a /etc/profile.d/canvas_vars.sh
echo "export S3_BUCKET=${S3_BUCKET}" | sudo tee -a /etc/profile.d/canvas_vars.sh
echo "export RDS_ADDRESS=${RDS_ADDRESS}" | sudo tee -a /etc/profile.d/canvas_vars.sh
echo "export RDS_USERNAME=${RDS_USERNAME}" | sudo tee -a /etc/profile.d/canvas_vars.sh
echo "export RDS_PASSWORD=${RDS_PASSWORD}" | sudo tee -a /etc/profile.d/canvas_vars.sh
echo "export RDS_DBNAME=${RDS_DBNAME}" | sudo tee -a /etc/profile.d/canvas_vars.sh
echo "export REDIS_ADDRESS=${REDIS_ADDRESS}" | sudo tee -a /etc/profile.d/canvas_vars.sh
echo "export CANVAS_ENCRYPT_KEY=${CANVAS_ENCRYPT_KEY}" | sudo tee -a /etc/profile.d/canvas_vars.sh


# sudo service apache2 start
# sudo service canvas_init start
