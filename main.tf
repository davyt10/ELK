#main config file

module "VPC"{
  source             = "modules/VPC/"
  vpc_cidr           = "${var.vpc_cidr}"
  private_subnet_cidr = ["${split(",", "${var.private_subnet_cidr}")}"]
  public_subnet_cidr  = ["${split(",", "${var.public_subnet_cidr}")}"]
  availability_zone   = ["${split(",", "${var.availability_zone["multi_az"]}" )}"]

}

module "WEB_ELB"{
  source             = "modules/ELB/"
  elb_subnets        = ["${module.VPC.public_subnet_id}"]
  instances          = ["${module.WEB_INSTANCE.instance_ids}"]
  elb_name           = "webelb"
  internal           = "false"
  vpc_id             = "${module.VPC.vpc_id}"
  sg_name            = "ELB_SG"
  cidrlist           = ["xxx.xxx.xxx.xxx"]
}


module "WEB_INSTANCE"{
  source              = "modules/Web_Instance/"
  aws_key_name        = "ELKKEY"
  count               = "1"
  name                = "WEB"
  ami                 = "${data.aws_ami.Ubuntu.id}"
  subnet_ids          = ["${module.VPC.public_subnet_id}"]
  type                = "t2.micro"
  root_block_device    = "50"
  userdata            = "${file("${path.module}/userdata/Apache.sh")}"
  vpc_id              = "${module.VPC.vpc_id}"
  sg_name             = "WEB_SG"
  WEB_ELB_SG_ID       = "${module.WEB_ELB.SG_ID}"
}

module "ELK_INSTANCE"{
  source              = "modules/ELK_Instance/"
  aws_key_name        = "ELKKEY"
  count               = "2"
  name                = "ELK"
  ami                 = "${data.aws_ami.Ubuntu.id}"
  subnet_ids          = ["${module.VPC.private_subnet_id}"]
  type                = "t2.micro"
  root_block_device    = "50"
  userdata             = "gvfdg"
  vpc_id              = "${module.VPC.vpc_id}"
  sg_name             = "ELK_SG"
  WEB_SG_ID           = "${module.WEB_INSTANCE.SG_ID}"
}
