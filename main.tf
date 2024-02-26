provider "aws" {
  region = "ap-south-1"
}
 
# Create VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}
 
# Create Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}
 
# Create Public Subnet
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
}
 
# Create Private Subnet
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-south-1a"
}
 
# Create Route Table
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main.id
 
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}
 
# Associate Route Table with Subnets
resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.rt.id
}
 
resource "aws_route_table_association" "private_subnet_association" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.rt.id
}
 
# Create EC2 Instance
resource "aws_instance" "example" {
  ami           = "ami-03f4878755434977f"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id
 
  tags = {
    Name = "ExampleInstance"
  }
}
 
# Create Security Group
resource "aws_security_group" "example" {
  vpc_id = aws_vpc.main.id
 
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  tags = {
    Name = "ExampleSecurityGroup"
  }
}
 
# Allocate Elastic IP
resource "aws_eip" "example" {
  vpc      = true
}
 
# Associate Elastic IPwith EC2 Instances
resource "aws_eip_association" "example"{
  instance_id  =aws_instance.example.id
  allocation_id=aws.eip.example.id
}
