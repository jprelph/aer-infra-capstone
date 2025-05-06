resource "aws_vpc" "web-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "web-vpc"
  }
}

resource "aws_subnet" "subnet-a" {
  vpc_id     = aws_vpc.web-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name = "custom-vpc-subnet-a"
  }
}

resource "aws_subnet" "subnet-b" {
  vpc_id     = aws_vpc.web-vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "${var.region}b"

  tags = {
    Name = "custom-vpc-subnet-b"
  }
}

resource "aws_internet_gateway" "web-gw" {
  vpc_id = aws_vpc.web-vpc.id

  tags = {
    Name = "web-vpc-ig"
  }
}

resource "aws_default_route_table" "web-rt" {
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.web-gw.id
  }
  default_route_table_id = aws_vpc.web-vpc.default_route_table_id
}
