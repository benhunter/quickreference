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

# Netshoot Container https://github.com/nicolaka/netshoot
docker login localhost:30000
docker build -t ben/netshoot .
docker tag ben/netshoot localhost:30000/ben/netshoot
docker push localhost:30000/ben/netshoot

docker build --platform linux/amd64 -t localhost:30000/ben/netshoot:latest-amd64 .
docker push localhost:30000/ben/netshoot:latest-amd64

# Netshoot Container in K8s
kubectl run --rm -i --tty temp-busybox --image=localhost:30000/ben/netshoot --restart=Never --overrides='{"spec": {"hostNetwork": true}}'

## In container
skopeo login --tls-verify=false http://localhost:30000
skopeo copy --src-tls-verify=false docker://localhost:30000/ben/netshoot oci:netshoot:latest
