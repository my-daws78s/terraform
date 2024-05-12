#ami           = "ami-090252cbe067a9e58"
#vpc_security_group_ids = [aws_security_group.allow_tls.id]
#instance_type = "t2.micro"

# we now try to define all values from ec2.tf inside variables..

variable "image_id" { # picked from google variables in terraform
    type = string #optional
    default = "ami-090252cbe067a9e58" #optional
    description = "RHEL-9-DevOps-Practice" #optional
}

variable "instance_type" {
    default = "t2.micro"
    type = string
}

variable "tags" {
    default = {
        Project = "Expense"
        Environment = "DEV"
        Module = "DB"
        Name = "DB"
    }
}

variable "sg_name" {
    default = "allow_ssh"
}

variable "sg_description" {
    default = "Allowing port 22"
}

variable "ssh_port" {
    default = 22
}
variable "protocol" {
    default = "tcp"
}
variable "allowed_cidr" {
    default = ["0.0.0.0/0"]
}