cd /var/www/fastapi

# Create and activate virtual environment
python3 -m venv venv
source venv/bin/activate

# Install dependencies
pip install --upgrade pip
pip install -r requirements.txt

# Set permissions
sudo chown -R ubuntu:ubuntu /var/www/fastapi

# Ensure supervisor config exists
sudo cat > /etc/supervisor/conf.d/fastapi.conf << EOF
[program:fastapi]
directory=/var/www/fastapi
command=/var/www/fastapi/venv/bin/uvicorn main:app --host 0.0.0.0 --port 8010
autostart=true
autorestart=true
stderr_logfile=/var/log/supervisor/fastapi.err.log
stdout_logfile=/var/log/supervisor/fastapi.out.log
user=ubuntu
environment=PATH="/var/www/fastapi/venv/bin"
EOF

# # Ensure nginx config exists
# sudo cat > /etc/nginx/sites-available/fastapi << EOF
# server {
#     listen 80;
#     server_name _;

#     location / {
#         proxy_pass http://127.0.0.1:8000;
#         proxy_set_header Host \$host;
#         proxy_set_header X-Real-IP \$remote_addr;
#         proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
#         proxy_set_header X-Forwarded-Proto \$scheme;
#     }
# }
# EOF

# # Enable nginx site if not already enabled
# if [ ! -f /etc/nginx/sites-enabled/fastapi ]; then
#     sudo ln -s /etc/nginx/sites-available/fastapi /etc/nginx/sites-enabled/
#     sudo rm -f /etc/nginx/sites-enabled/default
# fi