provider "aws" {
  region = "eu-central-1"
}

resource "aws_s3_bucket" "my_bucket1" {
  bucket = "my-unique-bucket-name-12345-qwyjejdk"
  depends_on = [ aws_s3_bucket.my_bucket2 ] # This will ensure that my_bucket2 is created before my_bucket1
}

resource "aws_s3_bucket" "my_bucket2" {
  bucket = "my-unique-bucket-name-12346-djbsckm"
}