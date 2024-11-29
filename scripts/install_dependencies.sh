#!/bin/bash

set -e

echo "Installing dependencies..."
sudo apt update
sudo apt install -y python3-pip python3-venv curl

# Install poetry
curl -sSL https://install.python-poetry.org | python3 -

# Add Poetry to PATH
export PATH="$HOME/.local.bin:$PATH"

# Verify Poetry installation
poetry --version || { echo "Poetry installation failed!"; exit 1; }

# Navigate to the application directory
echo "Navigating to application directory..."
cd /home/ubuntu/demo_public || { echo "Directory not found!"; exit 1; }

# Install dependencies using Poetry
echo "Installing dependencies with Poetry..."
poetry install --no-dev  # Include --no-dev to install only production dependencies
