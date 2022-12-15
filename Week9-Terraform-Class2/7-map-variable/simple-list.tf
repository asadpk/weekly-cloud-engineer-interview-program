locals {
  avengers = ["ironman", "captain america", "thor", "doctor strange", "spider man", "hulk", "black panther", "black widow"]
}
resource "null_resource" "avengers" {
  for_each = toset(local.avengers)
  triggers = {
    name = each.value
  }
}
output "avengers" {
  value = null_resource.avengers
}