cd /var/www/fastapi

# Create and activate virtual environment
python3 -m venv venv
source venv/bin/activate

# Install dependencies
pip install --upgrade pip
pip install -r requirements.txt

# Set permissions
sudo chown -R ubuntu:ubuntu /var/www/fastapi
