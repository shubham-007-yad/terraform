output "instance_id" {
  value = aws_instance.app.id
}

output "public_ip" {
  value = aws_instance.app.public_ip
}

output "flask_url" {
  value = "http://${aws_instance.app.public_ip}:5000"
}

output "express_url" {
  value = "http://${aws_instance.app.public_ip}:3000"
}