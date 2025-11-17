# Find latest Amazon Linux 2 (x86_64) AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# create key pair in AWS using public key provided via TF_VAR_public_key
resource "aws_key_pair" "deployer" {
  key_name   = "react"
  public_key = var.public_key
}

# security group allowing HTTP and SSH
resource "aws_security_group" "allow_http_ssh" {
  name        = "brainwave-sg-${random_id.suffix.hex}"
  description = "Allow SSH and HTTP"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}


# EC2 instance (no remote-exec provisioner)
resource "aws_instance" "app_server" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_http_ssh.id]

  tags = {
    Name = "brainwave-app-server"
  }
}
resource "random_id" "suffix" {
  byte_length = 4
}