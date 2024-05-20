terraform {
  required_version = ">= 0.14"

  backend "remote" {
    organization = "PAN-Black-Belts-Team"

    workspaces {
      name = "TFC"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

module "ec2_instance" {
source = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  instance_type          = "t2.micro"
  key_name               = "user1"
  monitoring             = true


}
