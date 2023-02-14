provider "aws" {
 region ="us-east-1" 
access_key = "AKIATDUWVZRVWJWUCTET"
secret_key = "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"
}


resource "aws_vpc" "text" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "text"
  }
}

resource "aws_subnet" "text" {
  vpc_id     = aws_vpc.text.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "text"
  }
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.text.id

  tags = {
    Name = "text-igw"
  }
}

resource "aws_instance" "text-ec2" {
  ami           = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.micro"

  tags = {
    Name = "text-ec2"
  }
}