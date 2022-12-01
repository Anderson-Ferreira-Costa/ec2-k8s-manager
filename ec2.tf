data "aws_ami" "am2" {
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.*-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["137112412989"]
}

resource "aws_instance" "this" {
  ami                    = data.aws_ami.am2.id
  instance_type          = var.instance_type
  iam_instance_profile   = var.iam_instance_profile
  vpc_security_group_ids = [aws_security_group.this.id]
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  user_data              = file("user-data.sh")


  tags = {
    Name = var.ec2_name
  }
}