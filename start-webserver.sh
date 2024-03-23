#!/bin/bash

# Install Nginx web server
sudo apt update
sudo apt install nginx -y

# git clone https://github.com/SemilJain/Citizen-CloudLab.git
# cd Citizen-CloudLab

sudo mkdir -p /var/www/citizen-cloudlab/html
sudo chown -R $USER /var/www/citizen-cloudlab/html
sudo chmod -R 755 /var/www/citizen-cloudlab

# Copy HTML/CSS/JavaScript files to the destination directory
sudo cp -r /local/repository/* /var/www/citizen-cloudlab/html/
sudo cp /local/repository/citizen-cloudlab-nginx /etc/nginx/sites-available/citizen-cloudlab

sudo ln -s /etc/nginx/sites-available/citizen-cloudlab /etc/nginx/sites-enabled/

# Start Nginx web server
sudo systemctl restart nginx

# Check if Nginx is running
if systemctl is-active --quiet nginx ; then
    echo "Nginx web server is running on port 8083" > /local/repository/status
else
    echo "Failed to start Nginx web server."  > /local/repository/status
fi
