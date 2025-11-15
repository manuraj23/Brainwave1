variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Name for EC2 key pair (created from public key)"
  type        = string
  default     = "brainwave-key"
}

variable "public_key" {
  description = "Public SSH key contents to configure EC2 (PEM.pub content). Provided via GitHub secret as TF_VAR_public_key in workflow."
  type        = string
  default     = ""
}

variable "ami" {
  description = "AMI id to use (Amazon Linux 2 default). Update if needed for your region."
  type        = string
  default     = ""
}

variable "ssh_user" {
  description = "SSH username for instance"
  type        = string
  default     = "ec2-user"
}
