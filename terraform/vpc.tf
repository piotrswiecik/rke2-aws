resource "aws_vpc" "kubernetes_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "vpc-${var.aws_region}-kubernetes"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "random_shuffle" "az" {
  input        = data.aws_availability_zones.available.names
  result_count = 1
}

resource "aws_subnet" "kubernetes_subnet" {
  vpc_id                  = aws_vpc.kubernetes_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  availability_zone = random_shuffle.az.result[0]

  tags = {
    Name = "subnet-${random_shuffle.az.result[0]}-public-kubernetes"
  }
}
