locals {
  instance_key_name = "kubernetes-ec2-key-${formatdate("YYYYMMDD", timestamp())}"
}

variable "instance_key_dir" {
  default = "."
}

resource "tls_private_key" "instance_private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "instance_key_pair" {
  key_name   = "kubernetes_ec2_key"
  public_key = tls_private_key.instance_private_key.public_key_openssh

  depends_on = [
    tls_private_key.instance_private_key
  ]
}

resource "local_file" "instance_private_key_local_storage" {
  content         = tls_private_key.instance_private_key.private_key_pem
  filename        = "${var.instance_key_dir}/${local.instance_key_name}.pem"
  file_permission = "0600"

  depends_on = [
    tls_private_key.instance_private_key
  ]
}