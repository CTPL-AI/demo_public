#!/bin/bash

set -e

PORT_NO =8010
echo "Stopping FastAPI application on PORT_NO $PORT_NO..."

#Find the process using the PORT_NO and kill it
#custom check
PID= $(lsof -ti:$PORT_NO) # Get the Process Id (PID) using the PORT_NO
if [-n "PID"]; then
    kill -9 $PID
    echo "Application running on PORT_NO $PORT_NO, with pid $PID has been stopped."
else
