resource "aws_s3_bucket" "artifactory" {
  bucket = "shareef-artifactory-cicd"
  tags = {
    name = "shareef-artifactory-cicd"
    
  }
}
