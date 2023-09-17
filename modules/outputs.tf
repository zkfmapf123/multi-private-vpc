output "out" {
  value = {
    vpc_id     = aws_vpc.vpc.id
    subnet_ids = [aws_subnet.public-subnet.id]
    app_name   = var.common_app_name
    cidr       = var.vpc_cidr
    igw_id     = aws_internet_gateway.igw.id
  }
}
