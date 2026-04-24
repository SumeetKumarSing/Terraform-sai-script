provider "aws" {
  region = "eu-central-1"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name-12345-xxxxx" # Replace with exsisting bucket name to import th data
}

# cmd will be : terraform import aws_s3_bucket.my_bucket my-unique-bucket-name-12345-xxxxx