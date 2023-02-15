#!/bin/bash

# Install Git
sudo apt-get install git


echo "deb http://security.ubuntu.com/ubuntu focal-security main" | sudo tee /etc/apt/sources.list.d/focal-security.list

sudo apt-get update
sudo apt-get install libssl1.1

# Import the MongoDB public key

sudo apt-get install gnupg

wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -

# Create a list file for MongoDB
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list

# Reload local package database
sudo apt-get update

# Install MongoDB
sudo apt-get install -y mongodb-org=4.4.0 mongodb-org-server=4.4.0 mongodb-org-shell=4.4.0 mongodb-org-mongos=4.4.0 mongodb-org-tools=4.4.0     
# Start the MongoDB service
sudo systemctl start mongod

# Verify that MongoDB has started successfully
sudo systemctl status mongod

# Install nodeJS
sudo apt install nodejs

# Install npm
sudo apt install npm

# Pull the medical-record-system-bac repository to the desktop
cd ~/Desktop
git clone https://github.com/jutnhbr/medical-record-system-bac

# Change to the folder where the repo was pulled
cd medical-record-system-bac
ls
pwd

# Define the content for the .env file
#content="DB_STRING=mongodb://localhost:27017/E-Akte
#SECRET=fb2e77d.47a045514510523cfwab4a1f626d174d2dqwwq2412w5"

# Create the .env file
echo "$content" > .env

# Execute initDB script
npm install
node initDB.js &

# Start Backend
(npm run dev&)

# Start frontend
cd client
npm install
npm run start


