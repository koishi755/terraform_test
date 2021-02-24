# Configure the AWS Provider
provider "aws" {
  profile = "terraform"
  region  = "ap-northeast-1"
  access_key = "my_access_key"
  secret_key = "my_secret_key"
}

# Create a VPC
resource "aws_vpc" "main" {
  for_each = var.vpc_list
  cidr_block = lookup(each.value, "cidr_block")
  tags = {
    Name = lookup(each.value, "name")
  }
}

variable "vpc_list"{
  default = {
      vpc1 = {
        name = "vpc1"
        cidr_block = "10.0.0.0/16"
      }
      vpc2 = {
        name = "vpc2"
        cidr_block = "10.1.0.0/16"
      }
      vpc3 = {
        name = "vpc3"
        cidr_block = "10.2.0.0/16"
      }
   }
}

resource "aws_subnet" "vpc1-subnets" {
  for_each = var.vpc1
  cidr_block = lookup(each.value, "cidr_block")
  availability_zone = lookup(each.value, "availability_zone")
  tags = {
    Name = lookup(each.value, "name")
  }
  vpc_id = aws_vpc.main["vpc1"].id
}

variable vpc1{
  default = {
    subnet1 = {
      availability_zone = "ap-northeast-1a"
      cidr_block = "10.0.0.0/24"
      name = "sub1"
    }
    subnet2 = {
      availability_zone = "ap-northeast-1a"
      cidr_block = "10.0.1.0/24"
      name = "sub2"
    }
  }
}