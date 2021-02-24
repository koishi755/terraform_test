provider "aws" {
  profile = "terraform"
  region  = "ap-northeast-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0cbc0209196a8063b"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}

variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ExampleInstance"
}
