aws_key_name = "ELKKEY"
aws_key_path = "../key/ELKKEY"

az_mapping = "multi_az"
vpc_cidr = "10.51.0.0/16"
private_subnet_cidr = "10.51.0.0/24,10.51.1.0/24"
public_subnet_cidr =  "10.51.2.0/24,10.51.3.0/24"

Ansible_Inventory = "pathto../../../inventory/ec2.py"
Ansible_boot_play = "../Ansible/setHostname.yml"
