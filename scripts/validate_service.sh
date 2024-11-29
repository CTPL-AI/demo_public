sleep 10

# Test if the application is responding
http_response=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8010)

if [ "$http_response" -eq 200 ]; then
    echo "Application is running successfully"
    exit 0
else
    echo "Application failed to start properly"
    echo "HTTP response code: $http_response"
    
    exit 1
fi