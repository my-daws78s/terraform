# resource <resource-type> <resource-name>

resource "aws_instance" "db-instance" {

  # left side before = are arguments and right side are called as values..
  #ami = "ami-090252cbe067a9e58" #required field
  ami = var.image_id
  #instance_type = "t2.micro" #required field
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = "db"
    Purpose = "Murali's ec2 instance setup..."
  }
}

resource "aws_security_group" "allow_ssh" {
  #name = "allow_ssh"
  name = var.sg_name
  #description = "Allow TLS inbound traffic and all outbound traffic"
  description = var.sg_description

  # this is not map but block in terraform
  ingress {
    #from_port        = 22
    from_port         = var.ssh_port
    #to_port           = 22
    to_port           = var.ssh_port
    #protocol         = "tcp"
    protocol          = var.protocol
    #cidr_blocks      = ["0.0.0.0/0"]
    cidr_blocks       = var.allowed_cidr
  }

  egress {
    from_port        = 0 # from 0 to 0 means, opening all ports
    to_port          = 0
    protocol         = "-1" # all protocols
    cidr_blocks      = ["0.0.0.0/0"]
  }

  # tags = {
  #   Name = "allow_tls"
  #   CreatedBy = "Murali Krishna"
  # }

  tags = var.tags
}