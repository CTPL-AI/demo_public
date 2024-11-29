sleep 10

# Test if the application is responding
http_response=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8010)

if [ "$http_response" -eq 200 ]; then
    echo "Application is running successfully"
    exit 0
else
    echo "Application failed to start properly"
    echo "HTTP response code: $http_response"
    
    # Print logs for debugging
    echo "=== Supervisor Logs ==="
    sudo tail -n 50 /var/log/supervisor/fastapi.err.log
    sudo tail -n 50 /var/log/supervisor/fastapi.out.log
    
    # echo "=== Nginx Error Logs ==="
    # sudo tail -n 50 /var/log/nginx/error.log
    
    exit 1
fi