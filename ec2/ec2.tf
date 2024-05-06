# resource <resource-type> <resource-name>
# Inside tag the name its used for ec2, it can be different than terraform resource-name 

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0 # from 0 to 0 means, opening all ports
    to_port          = 0
    protocol         = "-1" # all protocols
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
    CreatedBy = "Murali Krishna"
  }
}

resource "aws_instance" "db-instance" {
  ami           = "ami-090252cbe067a9e58"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type = "t2.micro"

  tags = {
    Name = "db"
    Purpose = "Murali's ec2 instance setup..."
  }
}