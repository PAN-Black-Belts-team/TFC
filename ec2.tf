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
  access_key = "AKIA3GBJQ3IPXNZWFOGX"
  secret_key = "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"
}

module "ec2_instance" {
source = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  instance_type          = "t2.micro"
  key_name               = "user1"
  monitoring             = true


}
