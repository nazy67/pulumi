# Providers variable
variable "aws_region" {
  type        = string
  description = "The region Terraform deploys your infra"
  default     = "us-east-1"
}

# VPC variables
variable "vpc_cidr_block" {
  type        = string
  description = "cidr block for the vpc"
  default     = "10.0.0.0/16"
}

# Subnet variables
variable "aws_az_1a" {
  type        = string
  description = "The region Terraform deploys your infra"
  default     = "us-east-1a"
}

variable "aws_az_1b" {
  type        = string
  description = "The region Terraform deploys your infra"
  default     = "us-east-1b"
}

variable "cidr_block" {
  description = "ingress/egress cidr block"
  type        = string
  default     = "0.0.0.0/0"
}

variable "pub_cidr1_subnet" {
  type        = string
  description = "cidr block for the  1st public subnet"
  default     = "10.0.1.0/24"
}

variable "pub_cidr2_subnet" {
  type        = string
  description = "cidr block for the 3rd private subnet"
  default     = "10.0.2.0/24"
}
# Tags variables
variable "env" {
  type        = string
  description = "environment name"
  default     = "dev"
}

variable "managed_by" {
  type        = string
  description = "managed by tr or cfn"
  default     = "pulumi"
}

variable "owner" {
  type        = string
  description = "owner of the resources"
  default     = "nazy.khalilova"
}