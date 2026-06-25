output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app.public_ip
}

output "application_url" {
  description = "Application URL (HTTP)"
  value       = "http://${aws_instance.app.public_ip}"
}

output "health_url" {
  description = "Health check endpoint URL"
  value       = "http://${aws_instance.app.public_ip}/health"
}

output "ssh_command" {
  description = "SSH command to connect to the EC2 instance"
  value       = "ssh -i siddhan-assessment-key.pem ec2-user@${aws_instance.app.public_ip}"
}

output "instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.app.id
}
