resource "aws_instance" "ec2" {
  ami                    = "ami-0dd574ef87b79ac6c"
  instance_type          = "t3.micro"
  associate_public_ip_address = true
  subnet_id = aws_subnet.subnet-a.id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  user_data = file("startup.sh")
  key_name = "aws-er"
}

resource "aws_eip" "concourse-eip" {
  vpc = true
  instance = aws_instance.ec2.id
} 
