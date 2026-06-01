resource "aws_security_group" "apache_sg" {
  name        = "apache-sg"
  vpc_id      = "vpc-0c0adca510da584e8"

  ingress {
    description = "SSH Access"

    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }
 ingress {
    description = "HTTP Access"

    from_port   = 80
    to_port     = 80
    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "apache-sg"
  }
}

#creating apache
resource "aws_instance" "apache" {
  ami           = "ami-0685bcc683dadb6b9"
  instance_type = "t3.micro"

  key_name = aws_key_pair.cicd-key.id

  subnet_id = "subnet-001ec004bd5c5be4b"

  vpc_security_group_ids = [aws_security_group.apache_sg.id]
  user_data = file("apache.script.sh")


  tags = {
    Name = "apache"
  }
}