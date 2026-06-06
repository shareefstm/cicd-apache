resource "aws_s3_bucket" "artifactory" {
  bucket = "shareef-artifactory-cicd"
  force_destroy = true
  tags = {
    name = "shareef-artifactory-cicd"
    
  }
}
