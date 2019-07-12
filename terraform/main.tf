provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "${var.region}"
}

resource "aws_alb_target_group_attachment" "canvas_group_attachment" {
  target_group_arn = "${var.autoscaling_group_arn}"
  target_id = "${aws_instance.canvas.id}"
  port = 443
}

# Maquina virtual Application
resource "aws_instance" "canvas" {
  ami = "${var.packer_ami_id}"
  instance_type = "${var.instance_type}"
  connection {
    user = "${var.user}"
  }
  tags = {
    Name = "canvas-ec2"
  }
  vpc_security_group_ids = ["${var.internal_sg_id}"]
  subnet_id = "${var.subnet_default_a_id}"
}