variable "aws_region" {
  default     = "eu-central-1"
  type        = string
  description = "AWS Region used to deploy the infrastructure"
}

variable "master_instance_type" {
  type    = string
  default = "t2.medium"
}

variable "worker_instance_type" {
  type    = string
  default = "t2.medium"
}

variable "worker_instance_count" {
  type    = number
  default = 2
}

variable "instance_key_dir" {
  default = "${path.module}/../ansible"
}