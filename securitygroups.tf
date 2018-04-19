resource "aws_security_group" "secgroup-standard-security" {
  name        = "secgroup-standard-security"
  description = "Allow standard inbout and all outbound"
  vpc_id      = "${var.AWS_VPC_ID}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTPS"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP"
  }

  ingress {
    from_port   = 30001
    to_port     = 30001
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    description = "K8s-hello-world-app"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "Standard Config"
  }
}
