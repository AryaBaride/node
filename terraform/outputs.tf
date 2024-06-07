output "ecr_repository_url" {
  value = aws_ecr_repository.hello_world.repository_url
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.hello_world_cluster.name
}

output "ecs_service_name" {
  value = aws_ecs_service.hello_world_service.name
}
