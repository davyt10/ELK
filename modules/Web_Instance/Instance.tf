resource "aws_instance" "instance" {
  count             = "${var.count}"
  ami               = "${var.ami}"
  subnet_id         =  "${element(var.subnet_ids, count.index)}"
  key_name          = "${var.aws_key_name}"
  instance_type     = "${var.type}"
  vpc_security_group_ids    = ["${aws_security_group.SecurityGroup.id}"]
  user_data         = "${var.userdata}"

  provisioner "remote-exec" {
    script = "wait_for_instance.sh"

    connection {
      type     = "ssh"
      user     = "ubuntu"
      private_key = "${file("../../../../../sshkey/quest-eu-west-2.pem")}"
    }
  }


provisioner "local-exec" {
command = "ansible-playbook ${var.Ansible_boot_play} -i  ${var.Ansible_Inventory} --extra-vars 'Environment=Ansible01' "
}

  lifecycle { ignore_changes = ["user_data"] }

  root_block_device {
    volume_type = "gp2"
    volume_size = "${var.root_block_device}"
  }

  tags {
    Name                  = "${var.name}0${count.index+1}"

  }

}


