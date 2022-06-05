# creating a server for eu-west-2 region

resource "aws_instance" "Test-server1" {
  ami                         = var.ami
  instance_type               = var.type
  key_name                    = "SisterMAariama"
  associate_public_ip_address = true
  availability_zone           = var.az1
  subnet_id                   = aws_subnet.Test-public-sub1.id
  vpc_security_group_ids      = [aws_security_group.Test-sec-group.id]

  tags = {
    Name = "Test-server1"
  }
}

resource "aws_instance" "Test-server2" {

  ami                         = var.ami
  instance_type               = var.type
  key_name                    = "SisterMAariama"
  associate_public_ip_address = true
  availability_zone           = var.az2
  subnet_id                   = aws_subnet.Test-priv-sub1.id
  vpc_security_group_ids      = [aws_security_group.Test-sec-group.id]

  tags = {
    Name = "Test-server2"
  }
}