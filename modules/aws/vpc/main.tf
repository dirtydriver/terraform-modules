resource "aws_vpc" "main"{

    cidr_block = var.vpc_cdir
    tags = var.tags

}

resource "aws_subnet" "public_subnets" {
    count = length(var.public_subnet_cdirs)
    vpc_id = aws_vpc.main.id
    cidr_block = element(var.public_subnet_cdirs,count.index)
    availability_zone = element(var.azs,count.index)

    tags = {
      Name =" Public Subnet ${count.index +1}"
    }
}

resource "aws_subnet" "private_subnets" {
    count = length(var.private_subnet_cdirs)
    vpc_id = aws_vpc.main.id
    cidr_block = element(var.private_subnet_cdirs,count.index)
    availability_zone = element(var.azs,count.index)
    tags = {
      Name =" Private Subnet ${count.index +1}"
    }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name : "Internet Gateway"
  }
}
resource "aws_eip" "nat" {
  count = length(var.private_subnet_cdirs)
  domain = "vpc"

  tags = {
    Name = "Eip for NatGW ${count.index}"
  }
}
resource "aws_nat_gateway" "nat" {
  connectivity_type = "public"
  count = length(var.public_subnet_cdirs)
  allocation_id = aws_eip.nat.id
  subnet_id     = element(aws_subnet.public_subnets[*].id,count.index)

  tags = {
    Name = "Private Subnet Nat ${count.index}"
  }

  depends_on = [aws_internet_gateway.igw]
}

resource "aws_route_table" "internet_rt" {
    vpc_id = aws_vpc.main.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id       
    }

    tags = {
        Name: "Route to InternetGW"
    }
  
}


resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
}

resource "aws_route_table_association" "private" {
  count = length(var.public_subnet_cdirs)
  subnet_id      = element(aws_subnet.private_subnets[*].id,count.index)
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "public_subnet_asso" {
    count = length(var.public_subnet_cdirs)
    subnet_id = element(aws_subnet.public_subnets[*].id,count.index)
    route_table_id = aws_route_table.internet_rt.id
}