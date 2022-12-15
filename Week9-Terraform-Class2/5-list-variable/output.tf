output "IAM_user1" {
  value       = aws_iam_user.example[0].arn
  description = "The ARN for user iam users"
}

output "IAM_user2" {
  value       = aws_iam_user.example[1].arn
  description = "The ARN for user iam users"
}

output "IAM_user3" {
  value       = aws_iam_user.example[2].arn
  description = "The ARN for user iam users"
}