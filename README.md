# t_truck_web

docker-compose up --build -d

docker-compose down --build -d

# K8s

echo "mega_secret_key" | base64

kubectl apply -f k8s/ngrok.yaml -f k8s/web.yaml -f k8s/env/dev.yaml
