provider "aws" {
  region = var.region 
}

resource "aws_instance" "amazonlinuxmachine" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  count = var.count

 tags = {
    Name = var.tags
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
 variable "count" {
    default = "5"
 }
 variable "tags" {
    default = "motogp"
 }