### Terraform EC2 Instance with Docker-compose
This creates EC2 Instance and configure post installation pkgs to make it ready for application deployment via docker-compose

#### Required tools to INSTALL on workstation

[Terraform](https://www.terraform.io/downloads)
[AWSCLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
[AWSCLI-ACCESS](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)


#### Verify above tool installation and setup
```console
terraform version
aws sts get-caller-identity
```

#### Deployment
```console
terraform init
terraform validate
terraform plan
terraform apply
terraform show
```

After deployment complete, ssh to remote server and clone porject repo

```console
git clone https://github.com/ClearPointNZ/sre-assessment.git
```

Deploy Application via docker-compose

```console
cd sre-assessment/
docker-compose up --build -d
```