output "domain" {
  description = "domain name for cloudfront distribution"
  value = aws_cloudfront_distribution.static_content.domain_name
}
