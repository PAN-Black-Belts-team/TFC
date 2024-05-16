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

resource "aws_s3_bucket" "TFC_Prisma" {
  bucket = "TFC-bucket-Prisma"
  acl    = "private"

  tags = {
    Name        = "TFC-s3-bucket"
    Environment = "Prisma"
  }
}

resource "null_resource" "TFC_run_task" {
  provisioner "local-exec" {
    command = "echo 'Run task executed during apply phase' > /tmp/terraform_run_task.txt"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.TFC.bucket
}

