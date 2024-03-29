provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "beko-videos-bucket" {
  bucket = "beko-videos-bucket"

  website {
    index_document = "index.html"
  }

  force_destroy = true  

  versioning {
    enabled = false  
  }

  lifecycle_rule {
    enabled = false  
  }
}

resource "aws_s3_bucket_policy" "beko-videos_bucket_policy" {
  bucket = aws_s3_bucket.beko-videos-bucket.bucket

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Statement1",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::beko-videos-bucket/*"
        }
    ]
}
EOF
}

resource "aws_s3_bucket_public_access_block" "beko-videos_public_access_block" {
  bucket = aws_s3_bucket.beko-videos-bucket.id

  block_public_acls       = false
  ignore_public_acls      = false
  block_public_policy     = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "beko-videos-bucket-website" {
  bucket = aws_s3_bucket.beko-videos-bucket.bucket

  index_document {
    suffix = "index.html"
  }

  
}