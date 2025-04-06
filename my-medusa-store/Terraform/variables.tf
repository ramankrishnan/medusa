variable "db_username" {
  type        = string
  description = "postgres"
}

variable "db_password" {
  type        = string
  description = "root"
}

variable "medusa_image_tag" {
  type        = string
  description = "Tag for Medusa backend Docker image"
}
