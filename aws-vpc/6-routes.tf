resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id    # For private subnet : to go to internet --> use nat gateway
  }

tags = {
  "Name" = "${local.env}-private"
}

}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "${local.env}-public"
  }
}

# assign  private route_table -->  private subnet
resource "aws_route_table_association" "private-zone1" {
  subnet_id = aws_subnet.private-zone1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "privare-zone2" {
  subnet_id = aws_subnet.private-zone2.id
  route_table_id = aws_route_table.private.id
}

#assign  public_route_table  -->  public subnet

resource "aws_route_table_association" "public-zone1" {
  subnet_id = aws_subnet.public-zone1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-zone2" {
  subnet_id = aws_subnet.public-zone2.id
  route_table_id = aws_route_table.public.id
}