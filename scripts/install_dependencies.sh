#!/bin/bash

set -e  # Exit on any error

echo "### INSTALL DEPENDENCIES SCRIPT STARTED ###"

echo "1. Installing required packages..."
sudo apt update
sudo apt install -y python3-pip python3-venv curl || { echo "Failed to install packages!"; exit 1; }

echo "2. Installing Poetry..."
curl -sSL https://install.python-poetry.org | python3 - || { echo "Failed to install Poetry!"; exit 1; }

echo "3. Adding Poetry to PATH..."
export PATH="$HOME/.local/bin:$PATH"
echo "PATH is set to: $PATH"

echo "4. Verifying Poetry installation..."
poetry --version || { echo "Poetry is not installed correctly!"; exit 1; }

echo "5. Checking deployment directory..."
if [ ! -d "/demo_public" ]; then
  echo "Directory /demo_public does not exist!"
  echo "Available directories in /home/ubuntu:"
  ls -l / || { echo "Failed to list directories!"; exit 1; }
  exit 1
fi

echo "6. Navigating to application directory..."
cd /demo_public || { echo "Failed to navigate to /demo_public!"; exit 1; }

echo "7. Installing dependencies using Poetry..."
poetry install --no-dev || { echo "Failed to install dependencies with Poetry!"; exit 1; }

echo "### INSTALL DEPENDENCIES SCRIPT COMPLETED ###"
