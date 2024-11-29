#!/bin/bash

set -e

echo "Starting FastAPI application..."
cd /home/ubuntu/ubuntu/demo_public
nohup python3 -m uvicorn main:app --host 0.0.0.0 --port 8002 > /dev/null 2>$1 &