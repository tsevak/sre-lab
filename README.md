### SRE - DEMO

### Contineous Integration with Github Actions
There is workflow configured for contineuos integration which covers Frontend and Backend application docker container build and push to its public registry. This work flow configured as __manual dispatch__ as it is on demo.

we can configure it on __PUSH or PULL__ requests based on or as per our requirements.

For this action, Secrets are configured at GITHUB and then it used as __VAR__ in action code.

 
[GITHUB ACTIONS CODE](.github/workflows/CI.yml)


### Deployment Method

### standard docker-compose 
This method creates standard EC2 Instance by terraform code and then it adds required dependencies via userdata template

[TF-COMPOSE-METHOD](tf-compose-method/README.md)

#### Kuberneted based Application Deployment


#### Test Application on minikube locally before pushing for cloud deployment
Install minikube
[MINIKUBE](https://minikube.sigs.k8s.io/docs/start/)

```console 
minikube start
```
Deploy Application and verify
```console
k apply -f k8s/
k get deployment,pods,svc
minikube service web
```
#### Deploy AWS EKS CLUSTER

[AWS EKS CODE](EKS/README.md)

#### Deploy Application
```console
k apply -f k8s/
```

Verify Deployment
```console
 k get Deployment,svc
 ```

 To access Application locally
 ```console
k port-forward svc/web 3000:3000
```
Test Application
```console
curl http://127.0.0.1:3000/
```
[Access from Browser](http://127.0.0.1:3000/)


#### Further to enable Ingress on application to access globally

#### Install AWS ALB Ingress Controller to Cluster

Install AWS ALB CONTROLLER for Cluster
```console
helm repo add eks https://aws.github.io/eks-charts
helm repo update

helm install aws-load-balancer-controller \
 eks/aws-load-balancer-controller   -n kube-system  \
--set clusterName=demo-cluster  \          # demo-cluster is clusterName here
--set serviceAccount.create=false  \
--set serviceAccount.name=aws-load-balancer-controller
```
Verify AWS ALB controller 
```console
kubectl get deployment -n kube-system aws-load-balancer-controller
```
Apple Ingress resources for Application
```console
k apply -f ingress.yaml
```
Verify Ingress and get Access Address 
```console
 k get ingress
 ```