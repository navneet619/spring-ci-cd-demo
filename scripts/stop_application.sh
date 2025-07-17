#!/bin/bash
# Stop the Spring Boot application if it's running

echo "Stopping application..."

# Find the process ID (PID) of the Spring Boot app
# We use 'grep -f' to match the full path of the JAR if possible, or just the app name
PID=$(ps -ef | grep 'spring-ci-cd-demo.jar' | grep -v grep | awk '{print $2}')

if [ -z "$PID" ]; then
    echo "Spring Boot application is not running."
else
    echo "Found running Spring Boot application with PID: $PID. Killing it..."
    kill -9 "$PID"
    echo "Application stopped."
fi