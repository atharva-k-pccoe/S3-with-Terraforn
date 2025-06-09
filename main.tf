provider "aws" { 
region = "ap-south-1" 
} 

resource "aws_s3_bucket" "my_bucket" { 
bucket = "nextwork-unique-bucket-atharva-12345"
tags = {
    Project="Create an S3 Bucket with Terraform"
 }
} 


resource "aws_s3_bucket_public_access_block" "my_bucket_public_access_block" {
 bucket = aws_s3_bucket.my_bucket.id

 block_public_acls = true 
 ignore_public_acls = true 
 block_public_policy = true 
 restrict_public_buckets = true 
}

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.my_bucket.id
  key    = "index.html"
  source = "index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "css" {
  bucket = aws_s3_bucket.my_bucket.id
  key    = "style.css"
  source = "style.css"
  content_type = "text/css"
}