#!/bin/bash

set -e

PORT_NO=8010
echo "Attempting to stop FastAPI application on PORT $PORT_NO..."

# Get the Process ID (PID) using the PORT_NO
PID=$(lsof -ti:"$PORT_NO")

echo "PID: $PID"

# Check if PID is not empty
if [ -n "$PID" ]; then
    kill -9 $PID
    echo "Application running on PORT $PORT_NO, with PID $PID has been stopped."
else
    echo "No FastAPI application running on PORT $PORT_NO."
fi
