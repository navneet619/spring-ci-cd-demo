#!/bin/bash
# before_install.sh

echo "Running BeforeInstall hook..."

# Define application directory
APP_DIR="/opt/codedeploy-app"

# 1. Create the application deployment directory if it doesn't exist
# This ensures a clean slate and correct ownership/permissions
if [ ! -d "$APP_DIR" ]; then
  echo "Creating deployment directory: $APP_DIR"
  sudo mkdir -p "$APP_DIR"
  sudo chown ec2-user:ec2-user "$APP_DIR"
  sudo chmod 755 "$APP_DIR"
else
  echo "Deployment directory $APP_DIR already exists."
  # Clean up old files if the directory exists
  echo "Cleaning up old files in $APP_DIR..."
  sudo rm -rf "$APP_DIR"/*
fi

# 2. Install Java (Amazon Corretto 17)
# This ensures Java is available before the application starts
echo "Updating yum packages and installing Amazon Corretto 17..."
sudo yum update -y
sudo yum install -y java-17-amazon-corretto-devel

# 3. Ensure the application log directory exists and has correct permissions
LOG_DIR="/var/log/spring-ci-cd-demo"
if [ ! -d "$LOG_DIR" ]; then
  echo "Creating application log directory: $LOG_DIR"
  sudo mkdir -p "$LOG_DIR"
  sudo chown ec2-user:ec2-user "$LOG_DIR"
  sudo chmod 755 "$LOG_DIR"
else
  echo "Application log directory $LOG_DIR already exists."
fi

echo "BeforeInstall hook completed."