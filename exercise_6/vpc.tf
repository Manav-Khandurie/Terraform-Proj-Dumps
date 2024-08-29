resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "Terraform"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = var.ZONE[1]
  tags = {
    Name = "Terraform"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = var.ZONE[2]
  tags = {
    Name = "Terraform"
  }
}


resource "aws_subnet" "public_subnet_3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = true
  availability_zone       = var.ZONE[3]
  tags = {
    Name = "Terraform"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = true
  availability_zone       = var.ZONE[1]
  tags = {
    Name = "Terraform"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = true
  availability_zone       = var.ZONE[2]
  tags = {
    Name = "Terraform"
  }
}

resource "aws_subnet" "private_subnet_3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = true
  availability_zone       = var.ZONE[3]
  tags = {
    Name = "Terraform"
  }
}

resource "aws_internet_gateway" "vpc_igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "Terraform"
  }
}

resource "aws_route_table" "vpc_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc_igw.id
  }

  tags = {
    Name = "Terraform"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.vpc_rt.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.vpc_rt.id
}

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.public_subnet_3.id
  route_table_id = aws_route_table.vpc_rt.id
}