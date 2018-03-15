resource "aws_instance" "docker-manager1" {
  ami               = "${var.AWS_Default_AMI}"
  availability_zone = "us-east-1a"
  instance_type     = "${var.AWS_Default_Instance_Type}"
  key_name          = "Chef-Server"

  network_interface {
    network_interface_id = "${aws_network_interface.docker-manager1.id}"
    device_index         = 0
  }

  tags {
    Name = "Docker Manager 1"
  }
}

resource "aws_instance" "docker-manager2" {
  ami               = "${var.AWS_Default_AMI}"
  availability_zone = "us-east-1a"
  instance_type     = "${var.AWS_Default_Instance_Type}"
  key_name          = "Chef-Server"

  network_interface {
    network_interface_id = "${aws_network_interface.docker-manager2.id}"
    device_index         = 0
  }

  tags {
    Name = "Docker Manager 2"
  }

  #Copy the script file
  provisioner "file" {
    source      = "dockerscript.sh"
    destination = "/home/ubuntu/dockerscript.sh"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file("Chef-Server.pem")}"
      agent       = false
    }
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install dos2unix -y",
      "dos2unix /home/ubuntu/dockerscript.sh",
      "chmod +x /home/ubuntu/dockerscript.sh",
      "/home/ubuntu/dockerscript.sh",
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file("Chef-Server.pem")}"
      agent       = false
    }
  }
}
