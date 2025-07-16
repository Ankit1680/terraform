resource "aws_eip" "main" {
  domain = "vpc"

  tags = {
    "Name" = "${local.env}-nat"
  }
}


resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.main.id
  subnet_id = aws_subnet.public-zone1.id

  tags = {
    "Name" = "${local.env}-nat"
  }

  depends_on = [ aws_internet_gateway.main ]
}