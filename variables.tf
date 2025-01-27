variable "ec2_ami"{
  type = string
}


variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "vpc_id" {
  type = string
}

variable "aws_public_subnet" {
  type    = string
  default = ""
}

variable "aws_security_group" {
  type    = string
  default = ""
}

variable "instance_type" {
  type    = string
  default = "t3.medium"
}

variable "cluster_name" {
  type = string
  default = ""
}

variable "cluster_version" {
  type = string
  default = ""
}

variable "cluster_endpoint_public_access" {
  type = bool
  default = false
}

variable "enable_cluster_creator_admin_permissions" {
  type = bool
  default = false
}

variable "eks_instance_type" {
  type    = string
  default = "t3.medium"
}

variable "eks_min_size" {
  type = number
  default = 1
}

variable "eks_max_size" {
  type = number
  default = 3
}

variable "eks_desired_size" {
  type = number
  default = 2
}

variable "subnet_ids" {
  type = list(string)
  default = []
}

variable "tags" {
  type = map(string)
  default = {}
}

variable "node_role_arn" {
  type = string
}

variable "cluster_role_arn" {
  type = string
}


variable "aws_route_table" {
  type = string
}

variable "aws_internet_gateway"{
 type = string
}
