## vpc 
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "${var.common_app_name}-vpc"
  }
}

## igw
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.common_app_name}-igw"
  }
}

## public-subnet
resource "aws_subnet" "public-subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = "${var.region}a"

  tags = {
    Name = "${var.common_app_name}-public-subnet"
  }
}

## route_table 
resource "aws_route_table" "route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.common_app_name}-rt"
  }
}

## route_table mapping
resource "aws_route_table_association" "mapping" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.route-table.id
}
