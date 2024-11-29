cd /fastapi

# Create and activate virtual environment
python3 -m venv venv
source venv/bin/activate

# Install dependencies
pip install --upgrade pip
pip install -r requirements.txt

# Set permissions
sudo chown -R ubuntu:ubuntu /fastapi

# # Ensure supervisor config exists
# sudo cat > /etc/supervisor/conf.d/fastapi.conf << EOF
# [program:fastapi]
# directory=/fastapi
# command=/fastapi/venv/bin/uvicorn main:app --host 0.0.0.0 --port 8010
# autostart=true
# autorestart=true
# stderr_logfile=/var/log/supervisor/fastapi.err.log
# stdout_logfile=/var/log/supervisor/fastapi.out.log
# user=ubuntu
# environment=PATH="/fastapi/venv/bin"
# EOF