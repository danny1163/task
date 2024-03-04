provider "aws" {
  region = var.region 
}

resource "aws_instance" "motogp" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = "vpc-0aff7001e9cd80f7c"
  count = "5"

 tags = {
    Name = var.tags
  }
 }
terraform {
  backend "s3" {
    bucket                  = "dnyana"
    key                     = "motogp-project"
    region                  = "ap-south-1"
 }
}

variable "region" {
   default = "ap-south-1"
   description = "for deploying in aws"
 }
variable "ami" {
    default = "ami-03bb6d83c60fc5f7c"
    description = "for testing"
 }
variable "instance_type" {
    default = "t2.micro"
    description = "for demo"
 }
 variable "key_name" {
    default = "id_rsa"
    description = "for try"
 }
 variable "tags" {
    default = "motogp"
 }