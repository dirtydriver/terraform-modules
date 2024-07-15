
resource "random_shuffle" "subnets" {
  input = var.public_subnet_ids
  result_count = 1
}

resource "aws_instance" "bastion" {
  ami           = data.aws_ami.ubuntu.id# Change to your preferred AMI
  instance_type = var.instance_type
  subnet_id     = element(random_shuffle.subnets.result, 0)
  key_name      = var.key_name
  security_groups = [aws_security_group.bastion_sg.name]

  tags = {
    Name = "BastionHost-${var.name}"
  }
}