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

resource "aws_s3_bucket" "example" {
  bucket = "my-example-bucket-12345"
  acl    = "private"

  tags = {
    Name        = "example-s3-bucket"
    Environment = "Dev"
  }
}

resource "null_resource" "example_run_task" {
  provisioner "local-exec" {
    command = "echo 'Run task executed during apply phase' > /tmp/terraform_run_task.txt"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.example.bucket
}

