provider "aws" {
  access_key = "${var.AWS_Access_Key}"
  secret_key = "${var.AWS_Secret_Key}"
  region     = "${var.AWS_Default_Region}"
}

resource "aws_security_group" "vpc-e24cf099-standard-security" {
  name        = "vpc-e24cf099-standard-security"
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

resource "aws_subnet" "production-network" {
  vpc_id            = "${var.AWS_VPC_ID}"
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "staging-network" {
  vpc_id            = "${var.AWS_VPC_ID}"
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
}

resource "aws_network_interface" "docker-ubuntu" {
  subnet_id = "${aws_subnet.production-network.id}"
  private_ips = ["10.0.1.25"]
  security_groups = ["${aws_security_group.vpc-e24cf099-standard-security.id}"]
}
