locals {
  test_1 = module.common-vpc-environment-1.out
  test_2 = module.common-vpc-environment-2.out
  test_3 = module.common-vpc-environment-3.out
}

resource "aws_ec2_transit_gateway" "tgw" {
  description = "common-tgw"

  tags = {
    Name     = "TGW-common"
    Resource = "TGW"
  }

  transit_gateway_cidr_blocks = ["10.0.0.0/24"]
}

################################################################################
## attachment-test-1
################################################################################
resource "aws_ec2_transit_gateway_vpc_attachment" "test-1-connect" {
  subnet_ids         = local.test_1.subnet_ids
  vpc_id             = local.test_1.vpc_id
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id

  tags = {
    Name = "${local.test_1.app_name}-connect"
  }
}

resource "aws_route_table" "test-1-rt" {
  vpc_id = local.test_1.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = local.test_1.igw_id
  }

  route {
    cidr_block = local.test_2.cidr
    gateway_id = aws_ec2_transit_gateway.tgw.id
  }

  route {
    cidr_block = local.test_3.cidr
    gateway_id = aws_ec2_transit_gateway.tgw.id
  }

  tags = {
    Name = "${local.test_1.app_name}-rt"
  }
}

resource "aws_route_table_association" "test-1-rt-mapping" {
  subnet_id      = local.test_1.subnet_ids[0]
  route_table_id = aws_route_table.test-1-rt.id
}

################################################################################
## attachment-test-2
################################################################################
resource "aws_ec2_transit_gateway_vpc_attachment" "test-2-connect" {
  subnet_ids         = local.test_2.subnet_ids
  vpc_id             = local.test_2.vpc_id
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id

  tags = {
    Name = "${local.test_2.app_name}-connect"
  }
}

resource "aws_route_table" "test-2-rt" {
  vpc_id = local.test_2.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = local.test_2.igw_id
  }

  route {
    cidr_block = local.test_1.cidr
    gateway_id = aws_ec2_transit_gateway.tgw.id
  }

  route {
    cidr_block = local.test_3.cidr
    gateway_id = aws_ec2_transit_gateway.tgw.id
  }

  tags = {
    Name = "${local.test_2.app_name}-rt"
  }
}

resource "aws_route_table_association" "test-2-rt-mapping" {
  subnet_id      = local.test_2.subnet_ids[0]
  route_table_id = aws_route_table.test-2-rt.id
}

################################################################################
## attachment-test-3
################################################################################
resource "aws_ec2_transit_gateway_vpc_attachment" "test-3-connect" {
  subnet_ids         = local.test_3.subnet_ids
  vpc_id             = local.test_3.vpc_id
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id

  tags = {
    Name = "${local.test_3.app_name}-connect"
  }
}

resource "aws_route_table" "test-3-rt" {
  vpc_id = local.test_3.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = local.test_3.igw_id
  }

  route {
    cidr_block = local.test_1.cidr
    gateway_id = aws_ec2_transit_gateway.tgw.id
  }

  route {
    cidr_block = local.test_2.cidr
    gateway_id = aws_ec2_transit_gateway.tgw.id
  }

  tags = {
    Name = "${local.test_3.app_name}-rt"
  }
}

resource "aws_route_table_association" "test-3-rt-mapping" {
  subnet_id      = local.test_3.subnet_ids[0]
  route_table_id = aws_route_table.test-3-rt.id
}
