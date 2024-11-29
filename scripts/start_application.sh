sudo supervisorctl reread
sudo supervisorctl update

# Restart FastAPI application
sudo supervisorctl restart fastapi

# # Restart nginx
# sudo systemctl restart nginx

# Check if services are running
sudo supervisorctl status fastapi
# sudo systemctl status nginx