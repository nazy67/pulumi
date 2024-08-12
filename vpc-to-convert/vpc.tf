# VPC
resource "aws_vpc" "my_vpc" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.env}_vpc"
  } 
}

# Public Subnets
resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.pub_cidr1_subnet
  availability_zone = var.aws_az_1a
  tags = {
    Name = "${var.env}_pub_sub1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.pub_cidr2_subnet
  availability_zone = var.aws_az_1b
  tags = {
      Name = "${var.env}_pub_sub2"
    }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
      Name = "${var.env}_igw"
    }
}

# Public Route Table
resource "aws_route_table" "pub_rtb" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = var.cidr_block
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
      Name = "${var.env}_pub_rtb"
    }
}

# Public Route Table Association
resource "aws_route_table_association" "pub_sub1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.pub_rtb.id
}

resource "aws_route_table_association" "pub_sub2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.pub_rtb.id
}