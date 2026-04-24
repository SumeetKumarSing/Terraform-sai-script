provider "aws" {
  region = "eu-central-1"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-linux-lifecycle-block-example-hvdugiukjndjk"

  lifecycle {
    create_before_destroy = true # This will prevent from down time first craete and then destroy
    prevent_destroy = true # This will help Protection Against Accidental Deletion
    ignore_changes = [ tags ] # This will ignore changes to tags and prevent from unnecessary updates
  }

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}