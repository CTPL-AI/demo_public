cd /var/www/fastapi
source venv/bin/activate
nohup uvicorn main:app --port 8010 --host 0.0.0.0 > /dev/null 2>$1 &