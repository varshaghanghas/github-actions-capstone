#!/bin/bash
set -e

echo "Starting local application instance..."
node src/app.js &
APP_PID=$!

# Allow the server 3 seconds to fully initialize
sleep 3

echo "Pinging health validation route..."
RESPONSE_STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:3000/health)

echo "Cleaning up processes..."
kill $APP_PID

if [ "$RESPONSE_STATUS" -eq 200 ]; then
    echo "SUCCESS: Health route returned HTTP 200."
    exit 0
else
    echo "FAILURE: Target route returned HTTP $RESPONSE_STATUS."
    exit 1
fi
