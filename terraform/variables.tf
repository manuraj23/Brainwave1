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
  default     = "react"
}

variable "public_key" {
  description = "Public SSH key contents (one-line) to create AWS key pair"
  type        = string
  default     = ""
}

variable "ssh_user" {
  description = "SSH username for instance"
  type        = string
  default     = "ec2-user"
}
