resource "aws_key_pair" "key_pair" {
  key_name   = "${var.common_app_name}-keypair"
  public_key = file(var.ec2_key_path)
}

resource "aws_security_group" "linux-sg" {
  name        = "linux-sg"
  description = "linux-sg"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name     = "${var.common_app_name}-linux-sg"
    Resource = "sg"
  }
}

module "linux" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.common_app_name}-linux-instance"

  ami                         = var.ec2_ami
  instance_type               = var.ec2_type
  key_name                    = aws_key_pair.key_pair.key_name
  availability_zone           = "${var.region}a"
  subnet_id                   = aws_subnet.public-subnet.id
  vpc_security_group_ids      = [aws_security_group.linux-sg.id]
  monitoring                  = true
  associate_public_ip_address = false

  ebs_block_device = [{
    device_name           = "/dev/sda1"
    volume_size           = "10"
    delete_on_termination = true
  }]

  tags = {
    Name = "${var.common_app_name}-linux-container"
  }
}
