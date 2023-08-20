resource "aws_security_group" "kubernetes_security_group" {
  name        = "security-group-${var.aws_region}-kubernetes"
  description = "Allow access on RKE2 ports, internet egress only, SSH direct access"
  vpc_id      = aws_vpc.kubernetes_vpc.id

  tags = {
    Name = "security-group-${var.aws_region}-kubernetes"
  }

  ingress {
    description = "Allow SSH access from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow access to kube-apiserver port for cluster members"
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    self        = true
  }

  ingress {
    description = "Allow access to node registration port for cluster members"
    from_port   = 9345
    to_port     = 9345
    protocol    = "tcp"
    self        = true
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}