# Kubernetes

# Run a temporary pod
kubectl run --rm -i --tty temp-busybox --image=busybox --restart=Never

# Run temporary pod with access to localhost network
kubectl run --rm -i --tty temp-busybox --image=localhost:30000/ben/busybox --restart=Never --overrides='{"spec": {"hostNetwork": true}}'

# Run a temporary Skopeo
kubectl run --rm -i --tty skopeo-pod --image=containers/skopeo --restart=Never

# Gitea
helm install gitea gitea-charts/gitea
kubectl --namespace default port-forward svc/gitea-http 3000:3000

# Containers
docker push localhost:30000/ben/busybox
skopeo copy docker://localhost:30000/ben/busybox oci:busybox:latest
