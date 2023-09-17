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

## Routing Table은 만들어줘야 함
