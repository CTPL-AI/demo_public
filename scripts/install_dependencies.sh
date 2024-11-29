#!/bin/bash

set -e

echo "Installing dependencies..."
sudo apt update
sudo apt install -y python3-pip python3-venv curl

# Install poetry
curl -sSL https://install.python-poetry.org | python3 -

# Add Poetry to PATH
export PATH="$HOME/.local.bin:$PATH"

#Install dependencies using poetry
cd /home/ubuntu/demo_public
poetry install

