provider "aws" {
  region = "us-east-1"
}

# Define the path to your locally generated key
locals {
  private_key_path = "D:/Aravind/MyCourses/Terraform/TerraformEC2/terraform-ec2-key"
  public_key_path = "D:/Aravind/MyCourses/Terraform/TerraformEC2/terraform-ec2-key.pub"
}

# Create an AWS key pair using the locally generated public key
resource "aws_key_pair" "terraform-ec2-key" {
  key_name = "terraform-ec2-key"
  public_key = file(local.public_key_path)
}

# Create the EC2 instance and associate it with the key pair
resource "aws_instance" "terraform-ec2" {
  ami = var.ami_value
  instance_type = var.instance_type_value
  key_name = aws_key_pair.terraform-ec2-key.key_name
}

