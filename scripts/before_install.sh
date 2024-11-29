if [ -d /fastapi ]; then
    cd /fastapi
    if [ -d "venv" ]; then
        rm -rf venv
    fi
    rm -rf *
fi


# Ensure directory exists with correct permissions
sudo mkdir -p /fastapi
sudo chown -R ubuntu:ubuntu /fastapi