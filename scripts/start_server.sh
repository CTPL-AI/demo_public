#!/bin/bash

set -e

echo "Starting FastAPI application..."
cd /home/ubuntu/demo_public
nohup python3 -m uvicorn demo_public.main:app --host 0.0.0.0 --port 8002 > /dev/null 2>$1 &