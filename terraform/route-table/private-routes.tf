resource "aws_route_table" "private-route" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw-dev.id
  }

  tags = {
    Name = "dev-private"
  }
}

resource "aws_route_table_association" "private-sub1" {
  subnet_id      = aws_subnet.private-sub1.id
  route_table_id = aws_route_table.private-route.id
}

resource "aws_route_table_association" "private-sub2" {
  subnet_id      = aws_subnet.private-sub2.id
  route_table_id = aws_route_table.private-route.id
}
