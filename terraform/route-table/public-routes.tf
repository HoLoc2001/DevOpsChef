resource "aws_route_table" "public-route" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-routes"
  }
}

resource "aws_route_table_association" "public-sub1" {
  subnet_id      = aws_subnet.public-sub1.id
  route_table_id = aws_route_table.public-route.id
}

resource "aws_route_table_association" "public-sub2" {
  subnet_id      = aws_subnet.public-sub2.id
  route_table_id = aws_route_table.public-route.id
}
