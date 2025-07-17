#!/bin/bash
# Start the Spring Boot application

echo "Running ApplicationStart hook..."

APP_DIR="/opt/codedeploy-app"
JAR_NAME="spring-ci-cd-demo.jar"
LOG_FILE="/var/log/spring-ci-cd-demo/application.log"
# Ensure the log directory exists and is writable by ec2-user
mkdir -p "$(dirname "$LOG_FILE")"
chown ec2-user:ec2-user "$(dirname "$LOG_FILE")"
chmod 755 "$(dirname "$LOG_FILE")"

echo "Starting Spring Boot application from $APP_DIR/$JAR_NAME..."

# Start the JAR in the background, redirecting output to a log file
# The `&` at the end is crucial for the script to return immediately,
# allowing CodeDeploy to proceed.
nohup java -jar "$APP_DIR/$JAR_NAME" > "$LOG_FILE" 2>&1 &

# Give it a moment to start
sleep 10

echo "ApplicationStart hook completed. Check $LOG_FILE for details."