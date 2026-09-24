output "ecr_flask_repository" {
  value = aws_ecr_repository.flask.repository_url
}

output "ecr_express_repository" {
  value = aws_ecr_repository.express.repository_url
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.main.name
}

output "alb_dns_name" {
  value = aws_lb.app.dns_name
}

output "express_url" {
  value = "http://${aws_lb.app.dns_name}"
}

output "flask_url" {
  value = "http://${aws_lb.app.dns_name}:5000"
}

output "flask_service_name" {
  value = aws_ecs_service.flask.name
}

output "express_service_name" {
  value = aws_ecs_service.express.name
}