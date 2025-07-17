#!/bin/bash
# Pre-installation tasks

echo "Running BeforeInstall hook..."

DEPLOY_DIR="/opt/codedeploy-app"

# Create the deployment directory if it doesn't exist
if [ ! -d "$DEPLOY_DIR" ]; then
    echo "Creating deployment directory: $DEPLOY_DIR"
    mkdir -p "$DEPLOY_DIR"
    chown ec2-user:ec2-user "$DEPLOY_DIR"
    chmod 755 "$DEPLOY_DIR"
else
    echo "Deployment directory already exists: $DEPLOY_DIR"
fi

# Clean up old deployment files to ensure a fresh install
echo "Cleaning up old application files in $DEPLOY_DIR..."
# Remove only known files/directories to avoid accidental deletion of other data
rm -rf "$DEPLOY_DIR/spring-ci-cd-demo.jar"
rm -rf "$DEPLOY_DIR/appspec.yml"
rm -rf "$DEPLOY_DIR/scripts"

echo "BeforeInstall hook completed."