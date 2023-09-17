## provider
variable "provider_profile" {
  type = string
}

## common
variable "common_app_name" {
  type = string
}

## network
variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidr" {
  type = string
}

variable "region" {
  type = string
}

## ec2
variable "ec2_key_path" {
  type = string
}

variable "ec2_ami" {
  type    = string
  default = "ami-0e3a9423b7b281ba8"
}

variable "ec2_type" {
  type    = string
  default = "t4g.small"
}
