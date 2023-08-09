# Build and push docker images
docker build -t ravipati2008/fibonacci-client:latest -t ravipati2008/fibonacci-client:$GIT_SHA -f ./client/Dockerfile ./client
docker build -t ravipati2008/fibonacci-server:latest -t ravipati2008/fibonacci-server:$GIT_SHA -f ./server/Dockerfile ./server
docker build -t ravipati2008/fibonacci-worker:latest -t ravipati2008/fibonacci-worker:$GIT_SHA -f ./worker/Dockerfile ./worker
docker push ravipati2008/fibonacci-client:latest
docker push ravipati2008/fibonacci-server:latest
docker push ravipati2008/fibonacci-worker:latest
docker push ravipati2008/fibonacci-client:$GIT_SHA
docker push ravipati2008/fibonacci-server:$GIT_SHA
docker push ravipati2008/fibonacci-worker:$GIT_SHA

# Apply kubernetes configs and set correct images to force kubectl to apply latest image
kubectl apply -f k8s
kubectl set image deployments/client-deployment client=ravipati2008/fibonacci-client:$GIT_SHA
kubectl set image deployments/server-deployment server=ravipati2008/fibonacci-server:$GIT_SHA
kubectl set image deployments/worker-deployment worker=ravipati2008/fibonacci-worker:$GIT_SHA