locals {
  s3_origin_id = "myS3Origin"
}
# Create s3 bucket
resource "aws_s3_bucket" "static" {
  bucket = var.bucket_name
  acl    = "private"
  tags = var.tags
}
# upload required files
resource "aws_s3_bucket_object" "static_content" {
  for_each = fileset(var.folder_path, "*")
  bucket = aws_s3_bucket.static.id
  key = each.value
  source = "${var.folder_path}/${each.value}"
  etag = filemd5("${var.folder_path}/${each.value}")
  tags = var.tags
}

resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = "static content"
}
# create a  cloudfront distribution
resource "aws_cloudfront_distribution" "static_content" {
  origin {
    domain_name = aws_s3_bucket.static.bucket_regional_domain_name
    origin_id   = local.s3_origin_id
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
    }
  }
  enabled             = true
  is_ipv6_enabled     = true
  comment             = "static content"
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id
    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  tags = var.tags
  viewer_certificate {
    cloudfront_default_certificate = true
  }
  depends_on = [aws_s3_bucket.static]
}

# Creates policy to allow public access to the S3 bucket
resource "aws_s3_bucket_policy" "update_website_root_bucket_policy" {
  bucket = aws_s3_bucket.static.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "PolicyForWebsiteEndpointsPublicContent",
  "Statement": [
    {
      "Sid": "PublicRead",
      "Effect": "Allow",
      "Principal": "*",
      "Action": [
        "s3:GetObject"
      ],
      "Resource": [
        "${aws_s3_bucket.static.arn}/*",
        "${aws_s3_bucket.static.arn}"
      ]
    }
  ]
}
POLICY
}
