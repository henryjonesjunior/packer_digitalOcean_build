#!/bin/bash
# Script to install Nginx and enable on boot.

# Update your system:
yum update -y

# Install EPEL Repository, update EPEL, and install Nginx:
yum install -y epel-release
yum update -y
yum install -y nginx

#Start Nginx service and enable to start on boot:
systemctl enable nginx
systemctl start nginx

# Create new 'vhost' directory for domain configuration:
mkdir /etc/nginx/vhost.d

# Create a new directory to serve new content.
mkdir -p /var/www/html/newDomain

# Create a copy of original configuration files and import configuration:
cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.original
cp /tmp/nginx.conf.new /etc/nginx/nginx.conf

# Copy over the server block configuration:
cp /tmp/newDomain.conf /etc/nginx/vhost.d/newDomain.conf

# Copy over the html test page:
cp /tmp/index.html.new /var/www/html/newDomain/index.html

# Restart Nginx:
systemctl restart nginx
