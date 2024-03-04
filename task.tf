provider "aws" {
  region = var.region 
}

resource "aws_instance" "amazonlinuxmachine" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  security_groups = var.security_groups
  count = var.count

 tags = {
    Name = var.tags
  }
 }
resource "aws_s3_bucket" "dnyana" {
  bucket = "dnyana"
  tags = {
    Name = "motogp"
  }
}
terraform {
  backend "s3" {
    bucket = "mybucket"
    key    = "path/to/my/key"
    region = "us-east-1"
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
 variable "security_groups" {
    default = "sg-0e06c8b93a138f232"
 }
 variable "count" {
    default = "5"
 }
 variable "tags" {
    default = "motogp"
 }