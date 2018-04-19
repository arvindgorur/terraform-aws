resource "aws_instance" "ansible-control-server" {
  ami               = "${var.AWS_Default_AMI}"
  availability_zone = "us-east-1a"
  instance_type     = "${var.AWS_Default_Instance_Type}"
  key_name          = "Chef-Server"

  network_interface {
    network_interface_id = "${aws_network_interface.ansible-control-server.id}"
    device_index         = 0
  }

  #execute script
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install software-properties-common -y",
      "sudo apt-get install ansible -y",
      "sudo apt-get install tree"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file("Chef-Server.pem")}"
      agent       = false
    }
  }

  tags {
    Name = "Ansible Control Server"
  }
}

resource "aws_instance" "docker-dev" {
  ami               = "${var.AWS_Default_AMI}"
  availability_zone = "us-east-1a"
  instance_type     = "${var.AWS_Default_Instance_Type}"
  key_name          = "Chef-Server"

  network_interface {
    network_interface_id = "${aws_network_interface.docker-dev.id}"
    device_index         = 0
  }

  #execute script
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install python-minimal -y",
      "sudo apt-get install tree"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file("Chef-Server.pem")}"
      agent       = false
    }
  }

  tags {
    Name = "Docker Dev Server"
  }
}

resource "aws_instance" "docker-prod" {
  ami               = "${var.AWS_Default_AMI}"
  availability_zone = "us-east-1a"
  instance_type     = "${var.AWS_Default_Instance_Type}"
  key_name          = "Chef-Server"

  network_interface {
    network_interface_id = "${aws_network_interface.docker-prod.id}"
    device_index         = 0
  }

  #execute script
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install python-minimal -y",
      "sudo apt-get install tree"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file("Chef-Server.pem")}"
      agent       = false
    }
  }

  tags {
    Name = "Docker Prod Server"
  }
}

resource "aws_instance" "k8s-master" {
  ami               = "${var.AWS_Default_AMI}"
  availability_zone = "us-east-1a"
  instance_type     = "${var.AWS_Default_Instance_Type}"
  key_name          = "Chef-Server"

  network_interface {
    network_interface_id = "${aws_network_interface.k8s-master.id}"
    device_index         = 0
  }

  #execute script
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install python-minimal -y"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file("Chef-Server.pem")}"
      agent       = false
    }
  }

  tags {
    Name = "K8s Master"
  }
}

resource "aws_instance" "k8s-node-1" {
  ami               = "${var.AWS_Default_AMI}"
  availability_zone = "us-east-1a"
  instance_type     = "${var.AWS_Default_Instance_Type}"
  key_name          = "Chef-Server"

  network_interface {
    network_interface_id = "${aws_network_interface.k8s-node-1.id}"
    device_index         = 0
  }

  #execute script
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install python-minimal -y"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file("Chef-Server.pem")}"
      agent       = false
    }
  }

  tags {
    Name = "K8s Node 1"
  }
}

resource "aws_instance" "k8s-node-2" {
  ami               = "${var.AWS_Default_AMI}"
  availability_zone = "us-east-1a"
  instance_type     = "${var.AWS_Default_Instance_Type}"
  key_name          = "Chef-Server"

  network_interface {
    network_interface_id = "${aws_network_interface.k8s-node-2.id}"
    device_index         = 0
  }

  #execute script
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install python-minimal -y"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file("Chef-Server.pem")}"
      agent       = false
    }
  }

  tags {
    Name = "K8s Node 2"
  }
}
