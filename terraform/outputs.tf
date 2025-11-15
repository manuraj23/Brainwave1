output "public_ip" {
  description = "Public IP of the created instance"
  value       = aws_instance.app_server.public_ip
}

output "instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.app_server.id
}

