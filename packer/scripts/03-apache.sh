#!/bin/bash

cd /var/canvas

sudo a2enmod rewrite
sudo a2enmod passenger
sudo a2enmod ssl

# Mover archivos de forma manual por temas de permisos
sudo mv -f /tmp/canvas.conf /etc/apache2/sites-available/canvas.conf
sudo mv -f /tmp/envvars /etc/apache2/envvars

sudo unlink /etc/apache2/sites-enabled/000-default.conf
sudo a2ensite canvas