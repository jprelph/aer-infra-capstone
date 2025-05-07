variable "project" {
  description = "The name of the current project."
  type        = string
  default     = "my-project"
}

variable "allow_ssh_http_id" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_a_id" {
  type = string
}

variable "subnet_b_id" {
  type = string
}
