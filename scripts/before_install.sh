if [ -d /var/www/fastapi ]; then
    cd /var/www/fastapi
    if [ -d "venv" ]; then
        rm -rf venv
    fi
    rm -rf *
fi



# Ensure directory exists with correct permissions
sudo mkdir -p /var/www/fastapi
sudo chown -R ubuntu:ubuntu /var/www/fastapi