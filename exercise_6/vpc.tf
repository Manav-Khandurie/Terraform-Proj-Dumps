resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"  # Main VPC CIDR block covering 10.0.0.0/16
  instance_tenancy     = "default"      # Default tenancy for instances in VPC
  enable_dns_support   = true           # Enable DNS resolution support
  enable_dns_hostnames = true           # Enable DNS hostnames for instances
  tags = {
    Name = "Terraform"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"  # Public subnet 1 CIDR
  map_public_ip_on_launch = true           # Auto-assign public IP to instances
  availability_zone       = var.ZONE[1]    # AZ from variable list index 1
  tags = {
    Name = "Terraform"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"  # Public subnet 2 CIDR
  map_public_ip_on_launch = true           # Auto-assign public IP to instances
  availability_zone       = var.ZONE[2]    # AZ from variable list index 2
  tags = {
    Name = "Terraform"
  }
}

resource "aws_subnet" "public_subnet_3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.3.0/24"  # Public subnet 3 CIDR
  map_public_ip_on_launch = true           # Auto-assign public IP to instances
  availability_zone       = var.ZONE[3]    # AZ from variable list index 3
  tags = {
    Name = "Terraform"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.4.0/24"  # Private subnet 1 CIDR
  map_public_ip_on_launch = true           # Note: Private subnet with public IP mapping may be unintended
  availability_zone       = var.ZONE[1]    # AZ from variable list index 1
  tags = {
    Name = "Terraform"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.5.0/24"  # Private subnet 2 CIDR
  map_public_ip_on_launch = true           # Note: Private subnet with public IP mapping may be unintended
  availability_zone       = var.ZONE[2]    # AZ from variable list index 2
  tags = {
    Name = "Terraform"
  }
}

resource "aws_subnet" "private_subnet_3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.6.0/24"  # Private subnet 3 CIDR
  map_public_ip_on_launch = true           # Note: Private subnet with public IP mapping may be unintended
  availability_zone       = var.ZONE[3]    # AZ from variable list index 3
  tags = {
    Name = "Terraform"
  }
}

resource "aws_internet_gateway" "vpc_igw" {
  vpc_id = aws_vpc.main.id  # Attach IGW to main VPC
  tags = {
    Name = "Terraform"
  }
}

resource "aws_route_table" "vpc_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"              # Default route for internet access
    gateway_id = aws_internet_gateway.vpc_igw.id  # Route traffic through IGW
  }

  tags = {
    Name = "Terraform"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public_subnet_1.id  # Associate public subnet 1 with route table
  route_table_id = aws_route_table.vpc_rt.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.public_subnet_2.id  # Associate public subnet 2 with route table
  route_table_id = aws_route_table.vpc_rt.id
}

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.public_subnet_3.id  # Associate public subnet 3 with route table
  route_table_id = aws_route_table.vpc_rt.id
}