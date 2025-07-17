#!/bin/bash
# Simple health check
response=$(curl -s http://localhost:8080/hello)
if echo "$response" | grep -q "Hello World"; then
    echo "Application is running and responding."
    exit 0
else
    echo "Application did not respond as expected."
    exit 1
fi