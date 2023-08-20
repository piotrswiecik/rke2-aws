data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

variable "master_instance_type" {
  default = "t2.medium"
}

resource "aws_instance" "kubernetes_ec2_master" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.master_instance_type

  subnet_id = aws_subnet.kubernetes_subnet.id

  key_name = aws_key_pair.instance_key_pair.key_name

  tags = {
    Name = "ec2-${aws_subnet.kubernetes_subnet.availability_zone}-master"
  }
}

