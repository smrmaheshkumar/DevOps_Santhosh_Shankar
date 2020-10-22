# Kubernetes Commands

### View Container Logs
```
kubectl logs prometheus-prometheus-0 -c prometheus -n infrastructure
```
#
## Minikube Commands

```
minikube start
minikube stop

# Show Dashboard
minikube dashboard


# Exposing a service on Minikube 
# expose (rc, deployment, pod)
# Not sure if --type needs to be "LoadBalancer"
kubectl expose rc kubia --type=LoadBalancer --name kubia-service
minikube service kubia-service

curl $(minikube service hello-minikube --url)

# Another example
minikube ip
minikube service rsvp

# https://console.cloud.google.com/gcr/images/google-containers/GLOBAL/echoserver?gcrImageListsize=50
k run hello-minikube --image=gcr.io/google_containers/echoserver:1.10 --port=8080
kubectl expose deployment hello-minikube --type=NodePort

curl $(minikube service hello-minikube --url)

brewctl port-forward hello-minikube-f4c5cbbb6-hb2vm 3333:8080
curl localhost:3333

brewctl attach hello-minikube-f4c5cbbb6-hb2vm
```
#
### Deployment Commands

```bash
kubectl get deployments 
kubectl rollout status 
kubectl set image 
kubectl rollout history
```

#
### Create pod from local Docker image
Note: `imagePullPolicy: Never`
```
apiVersion: v1
kind: Pod
metadata:
  name: kube-mngt
spec:
  containers:
  - name: kube-mngt
    image: kube-mngt
    imagePullPolicy: Never
    command: ["sh", "-c", "trap : TERM INT; (while true; do sleep 1000; done) & wait"]
```

#
## Deployment + Service + Port-Forwarding

#### Create Pod
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-nginx
  labels:
    app: my-nginx
spec:
  replicas: 1
  selector:
    matchLabels:
      app: my-nginx
  template:
    metadata:
      labels:
        app: my-nginx
    spec:
      containers:
      - name: my-nginx
        image: nginx:1.15.3-alpine
        ports:
        - containerPort: 80
```
#### Create Service
```
apiVersion: v1
kind: Service
metadata:
  name: my-nginx
  labels:
    app: my-nginx
spec:
  ports:
  - port: 80
    protocol: TCP
  selector:
    app: my-nginx
```

####  Create port forwarding
```
kb port-forward service/my-nginx 8080:80
```

#
### Delete all resources based on selector (label query)
```
kubectl delete all --selector app=demo
```

# Security
### Check access: can-i
```
kubectl auth can-i list pods --as=system:serviceaccount:sec:myappsa -n=infrastructure
```

### Global God Access - Cluster Admin Privileges

This gives all service accounts (we could also say all pods) cluster-admin privileges, allowing them to do whatever they want.
```
kubectl create clusterrolebinding permissive-binding --clusterrole=cluster-admin --group=system:serviceaccounts
```
<sup>Kuberentest In Action Chap 8: 
https://www.safaribooksonline.com/library/view/kubernetes-in-action/9781617293726/kindle_split_019.html</sub>

#
### K8s Internal Status - (Scheduler, control-manager, etcd)
```
kb get componentstatuses

kubectl get po -o custom-columns=POD:metadata.name,NODE:spec.nodeName --sort-by spec.nodeName -n kube-system
```

#
### Query ectd
```
etcdctl ls /registry
```

#
### Get cluster events
``` 
kb get events --watch
```
```
kb get events -o custom-columns=NAME:metadata.name,KIND:involvedObject.kind,SOURCE:source,REASON:reason,MESSAGE:message --sort-by=lastTimestamp
```

#
### Nodes - Get IP addresses with an array
```
k get nodes  -o custom-columns=ADDRESS:status.addresses[*].address
```

#
### Using JSON Path with custom-columns
http://goessner.net/articles/JsonPath/


#
### Loop through resources
```
for i in $(k get schedule --all-namespaces -o custom-columns=NAME:.metadata.name | grep prometheus); do echo $i; ark schedule delete $i; done
```

#
### Get Pods and its containers
```
alias podcontainers="kubectl get pods --all-namespaces -o=custom-columns=NameSpace:.metadata.namespace,NAME:.metadata.name,CONTAINERS:.spec.containers[*].name"
```
