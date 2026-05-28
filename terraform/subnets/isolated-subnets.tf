resource "aws_subnet" "isolated-sub1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.128.0/19"
  availability_zone = "ap-southeast-1a"

  tags = {
    "Name" = "isolated-sub1"
  }
}

resource "aws_subnet" "isolated-sub2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.160.0/19"
  availability_zone = "ap-southeast-1b"

  tags = {
    "Name" = "isolated-sub2"
  }
}
