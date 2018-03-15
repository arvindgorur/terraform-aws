provider "aws" {
  access_key = "${var.AWS_Access_Key}"
  secret_key = "${var.AWS_Secret_Key}"
  region     = "${var.AWS_Default_Region}"
}

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

resource "aws_network_interface" "docker-manager1" {
  subnet_id = "subnet-cfdea692"
  private_ips = ["172.31.32.25"]
  security_groups = ["${aws_security_group.secgroup-standard-security.id}"]
}

resource "aws_network_interface" "docker-manager2" {
  subnet_id = "subnet-cfdea692"
  private_ips = ["172.31.32.26"]
  security_groups = ["${aws_security_group.secgroup-standard-security.id}"]
}
