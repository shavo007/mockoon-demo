# mockoon-demo
showcase mocking API using mockoon

Blog post: https://blog.shanelee.name/2021/08/29/mocking-a-rest-api-the-api-first-way-with-mockoon/
## dockerise version 1.4.0 (detached mode)

```bash
npm update -g @mockoon/cli@1.4.0
mockoon-cli dockerize --data ./Greetings_Mockoon.json --port 3000 --index 0 --output ./Dockerfile

#Then manually amend the docker file to add in detached mode and specify the data arg. see [Dockerfile](./Dockerfile)

#To run with transaction log
docker run -p 3000:3000 mockoon-greeting-api

```

## Kubernetes

```bash

docker build -t shanelee007/mockoon-greeting-api:1.0.0 .
#dry run (once only)
kubectl create deployment mockoon --image=shanelee007/mockoon-greeting-api:1.0.0 --dry-run=client --output=yaml > deployment.yaml
kubectl expose deployment mockoon --port=3000 --target-port=3000 --type=NodePort --dry-run=client --output=yaml > svc.yaml
kubectl apply -f deployment.yaml
kubectl apply -f svc.yaml
kubectl describe service mockoon
#access locally on node port
#inspect logs of the pod
kubectl logs -f <pod_name>
```
