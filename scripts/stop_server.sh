#!/bin/bash

set -e

PORT =8010
echo "Stopping FastAPI application on port $PORT..."

#Find the process using the port and kill it
#custom check
PID= $(lsof -ti:$PORT) # Get the Process Id (PID) using the port
if [-n "PID"]; then
    kill -9 $PID
    echo "Application running on port $PORT, with pid $PID has been stopped."
else
    echo "No process found running on port $PORT"