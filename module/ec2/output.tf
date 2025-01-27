# # Reference the existing subnet




output "aws_subnet_id" {
  value = data.aws_subnet.existing.id  # Existing subnet ID
}