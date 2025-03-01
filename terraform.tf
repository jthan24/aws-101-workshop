terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}

# Create a VPC
resource "aws_vpc" "principal" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support=true
  enable_dns_hostnames=true

  tags = {
    Name = "vpc-terraform"
  }
}

# Crear la subnet privada 2a
resource "aws_subnet" "private2a" {
  vpc_id     = aws_vpc.principal.id
  cidr_block = "10.0.128.0/20"
  availability_zone = "us-west-2a"

  tags = {
    Name = "subnet-private1-us-west-2a"
  }
}

# Crear la subnet privada 2b
resource "aws_subnet" "private2b" {
  vpc_id     = aws_vpc.principal.id
  cidr_block = "10.0.144.0/20"
  availability_zone = "us-west-2b"

  tags = {
    Name = "subnet-private2-us-west-2b"
  }
}

# Crear la subnet publica 2a
resource "aws_subnet" "public2a" {
  vpc_id     = aws_vpc.principal.id
  cidr_block = "10.0.0.0/20"
  availability_zone = "us-west-2a"

  tags = {
    Name = "subnet-public1-us-west-2a"
  }
}

# Crear la subnet publica 2b
resource "aws_subnet" "public2b" {
  vpc_id     = aws_vpc.principal.id
  cidr_block = "10.0.16.0/20"
  availability_zone = "us-west-2b"

  tags = {
    Name = "subnet-public2-us-west-2b"
  }
}

# Crear internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.principal.id

  tags = {
    Name = "igw"
  }
}

# Crear routetable public
resource "aws_route_table" "rtpublic" {
  vpc_id = aws_vpc.principal.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "rtb-public"
  }
}

# Asociar la routetable public a las subnet public
resource "aws_route_table_association" "rtpublic2a" {
  subnet_id      = aws_subnet.public2a.id
  route_table_id = aws_route_table.rtpublic.id
}
resource "aws_route_table_association" "rtpublic2b" {
  subnet_id      = aws_subnet.public2b.id
  route_table_id = aws_route_table.rtpublic.id
}
