resource "aws_network_interface" "docker-dev" {
  subnet_id = "subnet-cfdea692"
  private_ips = ["172.31.32.25"]
  security_groups = ["${aws_security_group.secgroup-standard-security.id}","${var.AWS_Default_Security_Group}"]

  tags {
    Name = "Docker Dev Server"
  }
}

resource "aws_network_interface" "docker-prod" {
  subnet_id = "subnet-cfdea692"
  private_ips = ["172.31.32.26"]
  security_groups = ["${aws_security_group.secgroup-standard-security.id}","${var.AWS_Default_Security_Group}"]
  tags {
    Name = "Docker Prod Server"
  }
}

resource "aws_network_interface" "k8s-master" {
  subnet_id = "subnet-cfdea692"
  private_ips = ["172.31.32.35"]
  security_groups = ["${aws_security_group.secgroup-standard-security.id}","${var.AWS_Default_Security_Group}"]
  tags {
    Name = "K8s Master Server"
  }
}

resource "aws_network_interface" "k8s-node-1" {
  subnet_id = "subnet-cfdea692"
  private_ips = ["172.31.32.36"]
  security_groups = ["${aws_security_group.secgroup-standard-security.id}","${var.AWS_Default_Security_Group}"]
  tags {
    Name = "K8s Node Server 1"
  }
}

resource "aws_network_interface" "k8s-node-2" {
  subnet_id = "subnet-cfdea692"
  private_ips = ["172.31.32.37"]
  security_groups = ["${aws_security_group.secgroup-standard-security.id}","${var.AWS_Default_Security_Group}"]
  tags {
    Name = "K8s Node Server 2"
  }
}

resource "aws_network_interface" "ansible-control-server" {
  subnet_id = "subnet-cfdea692"
  private_ips = ["172.31.32.40"]
  security_groups = ["${aws_security_group.secgroup-standard-security.id}","${var.AWS_Default_Security_Group}"]
  tags {
    Name = "Ansible Control Server"
  }
}
