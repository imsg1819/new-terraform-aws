
variable "ec2_ami"{
  type = string
}


variable "vpc_id" {
  type = string
}

variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "aws_public_subnet" {
  type    = string
  default = ""
}

variable "aws_route_table" {
  type    = string
  default = ""
}

variable "aws_internet_gateway" {
  type    = string
  default = ""
}

variable "aws_security_group" {
  type    = string
  default = ""
}

variable "aws_instance" {
  type    = string
  default = ""
}

variable "instance_type" {
  type    = string
  default = ""
}