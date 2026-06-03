resource "aws_security_group" "cicd_sg" {
  name        = "cicd-sg"
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

    from_port   = 8080
    to_port     = 8080
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
    Name = "cicd-sg"
  }
}
#creating apache
resource "aws_instance" "cicd" { 
   ami           = "ami-0685bcc683dadb6b9"
  instance_type = "t3.micro"

  key_name = aws_key_pair.cicd-key.id

  subnet_id = "subnet-001ec004bd5c5be4b"

  vpc_security_group_ids = [aws_security_group.cicd_sg.id]
  iam_instance_profile = aws_iam_instance_profile.artifactory.name
  user_data = file("jenkins-cicd.script.sh")


  tags = {
    Name = "cicd"
  }
  }