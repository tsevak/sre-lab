## EKS CLUSTER

### Useful command to verify Instance type availibility per zones
```console
aws ec2 describe-instance-type-offerings --location-type availability-zone  --filters Name=instance-type,Values=t2.micro --region ap-southeast-2 --output table
```

### Required tools to INSTALL on workstation
[EKSCTL](https://eksctl.io/)
[AWSCLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
[AWSCLI-ACCESS](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)

### Verify above tool installation and setup
```console
eksctl version
aws sts get-caller-identity
```

### Create Cluster

```console
eksctl create cluster -f cluster.yaml
```
#### Verify Cluster

```console
k get nodes
```

#### Let create simple pod to verify
```console
 k run nginx --image=nginx
 k get pods
 ```