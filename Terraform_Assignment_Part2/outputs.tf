output "flask_instance_id" {
  value = aws_instance.flask.id
}

output "flask_public_ip" {
  value = aws_instance.flask.public_ip
}

output "flask_private_ip" {
  value = aws_instance.flask.private_ip
}

output "flask_url" {
  value = "http://${aws_instance.flask.public_ip}:5000"
}

output "express_instance_id" {
  value = aws_instance.express.id
}

output "express_public_ip" {
  value = aws_instance.express.public_ip
}

output "express_url" {
  value = "http://${aws_instance.express.public_ip}:3000"
}