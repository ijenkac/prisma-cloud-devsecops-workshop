provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "dev_s3" {
  bucket_prefix = "dev-"

  tags = {
    Environment          = "Dev"
    yor_name             = "dev_s3"
    yor_trace            = "3fdea328-9085-494c-ba4d-593a9c627c2b"
    git_commit           = "d253209c584ef0f5e24461a61fbffc086b2ed0cb"
    git_file             = "code/build/s3.tf"
    git_last_modified_at = "2024-12-11 17:57:59"
    git_last_modified_by = "ijenkac@users.noreply.github.com"
    git_modifiers        = "ijenkac"
    git_org              = "ijenkac"
    git_repo             = "prisma-cloud-devsecops-workshop"
  }
}

resource "aws_s3_bucket_ownership_controls" "dev_s3" {
  bucket = aws_s3_bucket.dev_s3.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
