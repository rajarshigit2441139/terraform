# Create vpc
resource "aws_vpc" "flasVPC" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "TerraformFlaskVpc"
  }
}

# Create Public Subnet
resource "aws_subnet" "PublicSubnet" {
  vpc_id = aws_vpc.flasVPC.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

# Create Internet GateWay
resource "aws_internet_gateway" "flaskIgw" {
   vpc_id = aws_vpc.flasVPC.id
}

# Creae Route Table
resource "aws_route_table" "flaskRT" {
  vpc_id = aws_vpc.flasVPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.flaskIgw.id
  }
}

# RoutTable Association Public Subnet

resource "aws_route_table_association" "PublicRTassociation" {
  subnet_id = aws_subnet.PublicSubnet.id
  route_table_id = aws_route_table.flaskRT.id
}

