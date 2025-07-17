#!/bin/bash
# Validate the service is running and accessible

echo "Running ValidateService hook..."

APP_URL="http://localhost:8080/hello"
EXPECTED_RESPONSE_PART="Hello" # Just check for "Hello" in the response
MAX_RETRIES=10
RETRY_INTERVAL=5 # seconds

echo "Attempting to validate service at $APP_URL"

for i in $(seq 1 $MAX_RETRIES); do
    echo "Attempt $i of $MAX_RETRIES..."
    RESPONSE=$(curl -s "$APP_URL")
    if echo "$RESPONSE" | grep -q "$EXPECTED_RESPONSE_PART"; then
        echo "Service is healthy. Response: $RESPONSE"
        exit 0 # Success
    else
        echo "Service not yet healthy. Retrying in $RETRY_INTERVAL seconds..."
        sleep "$RETRY_INTERVAL"
    fi
done

echo "Service validation failed after $MAX_RETRIES attempts."
exit 1 # Failure