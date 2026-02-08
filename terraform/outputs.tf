output "ecr_frontend_repo" {
  value = aws_ecr_repository.forfrontendimage.repository_url
}
output "ecr_backend_repo" {
  value = aws_ecr_repository.forbackendimage.repository_url
}
