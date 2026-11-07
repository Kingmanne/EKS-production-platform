variable "repository_names" {
  description = "ECR repositories to create"
  type        = list(string)
}

variable "keep_last_images" {
  description = "How many images to keep per repository"
  type        = number
  default     = 10
}
