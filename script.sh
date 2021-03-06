#!/bin/bash -xev 

#########################################################################################################
#
# Name httpd.sh
#
# Script to auto install the apache web service, confuration of users must be done manually @ this time
# Author: Mark B.
# December 3 2016
#########################################################################################################



# Step 1: Install Apache
# First, clean-up yum:

sudo yum clean all

# As a matter of best practice we’ll update our packages:

sudo yum -y update

# Installing Apache is as simple as running just one command:

echo "We are now installing httpd"

sudo yum -y install httpd

# Step 2: Allow Apache Through the Firewall
# Allow the default HTTP and HTTPS port, ports 80 and 443, through firewalld:

echo "installing firewalld"

sudo yum -y install firewalld

wait

sudo systemctl start firewalld

echo "We are now allowing http traffic through the firewall"

sudo firewall-cmd --permanent --add-port=80/tcp

sudo firewall-cmd --permanent --add-port=443/tcp

# And reload the firewall:

echo "Reloading the firewall service"

sudo firewall-cmd --reload

wait

# Step 3: Configure Apache to Start on Boot
# And then start Apache:

sudo systemctl start httpd

# Be sure that Apache starts at boot:

echo "Set HTTPD to start on boot"

sudo systemctl enable httpd

echo "The HTTPD Daemon is now active"
exit 0
