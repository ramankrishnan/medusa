output "db_endpoint" {
  value = aws_db_instance.medusa_db.endpoint
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.medusa_cluster.name
}
