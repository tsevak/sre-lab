
resource "aws_key_pair" "dev-ssh-key" {
  key_name   = "dev-ssh-key"
  public_key = file("~/.ssh/dev-aws-key.pub")
}


resource "aws_instance" "dev_node" {
  ami           = data.aws_ami.node.id
  instance_type = "t3.medium"
  key_name      = aws_key_pair.dev-ssh-key.id

  root_block_device {
    volume_size = 20
  }

  user_data = templatefile("userdata.tpl", {})

  tags = {
    Name = "Dev-Node"
    Env  = "Dev"
  }
}



