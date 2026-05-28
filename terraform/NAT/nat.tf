resource "aws_eip" "nat-ip-dev" {
  domain = "vpc"

  tags = {
    Name = "nat-ip-dev"
  }
}

resource "aws_nat_gateway" "nat-gw-dev" {
  allocation_id = aws_eip.nat-ip-dev.id
  subnet_id     = aws_subnet.public-sub1.id

  tags = {
    Name = "nat-gw-dev"
  }

  depends_on = [aws_internet_gateway.igw]
}
