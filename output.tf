output "cicdip" {
  value = aws_instance.cicd.public_ip
}
output "cicdpubdns" {
  value = aws_instance.cicd.public_dns
}

output "apacheip" {
  value = aws_instance.apache.public_ip
}
output "apachepubdns" {
  value = aws_instance.apache.public_dns
}

output "aws_s3_bucket" {
  value = aws_s3_bucket.artifactory.bucket
  
}