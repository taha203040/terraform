provider "aws" {
  region = "eu-north-1"
}
locals {
  extra_tag = "extra-tag"
}

resource "aws_instance" "my_instance" {
  ami = var.ami
  instance_type = var.instance_type
  tags = {
    Name = var.instance_name
    ExtraTag = local.extra_tag
  }
}

# resource "aws_s3_bucket" "my_bucket" {
#   bucket = "nextwork-unique-bucket-ahmedrb-2040" # Make sure this bucket name is globally unique by typing a long random number
# }

# resource "aws_s3_bucket_public_access_block" "my_bucket_public_access_block" {
#   bucket = aws_s3_bucket.my_bucket.id

#   block_public_acls       = true
#   ignore_public_acls      = true
#   block_public_policy     = true
#   restrict_public_buckets = true
# }
# resource "aws_s3_object" "image" {
#   bucket = aws_s3_bucket.my_bucket.id # Reference the bucket ID
#   key    = "image.png" # Path in the bucket
#   source = "image.png" # Local file path
# }
