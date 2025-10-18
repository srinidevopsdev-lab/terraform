resource "aws_instance" "terraform" {
   ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_terraform.id]

  tags = {
      Name = "terraform"
      Terraform = "true"
  }
}


resource "aws_security_group" "allow_terraform" {
  name   = "sg_terraform"  

  egress {
    from_port        = 0   # from port to port 0 means allow all traffic
    to_port          = 0
    protocol         = "-1"   # allow all protocalls
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 0   # from port to port 0 means allow all traffic
    to_port          = 0
    protocol         = "-1"   # allow all protocalls
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-terraform"
  }
}