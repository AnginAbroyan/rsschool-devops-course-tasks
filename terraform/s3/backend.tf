data "aws_iam_role" "github_actions_role" {
  name = "GithubActionsRole"  # the name of my IAM role
}

# The backend
#terraform {
#  backend "s3" {
#    bucket         = "terraform-rs-bucket--anabroyan123456"
#    key            = "terraform/state"
#    region         = "eu-west-3"  # Adjust this to your region
#    encrypt        = true
#    dynamodb_table = "DynamoDB-table-state-locks123456"
#  }
#}

#S3 Bucket
resource "aws_s3_bucket" "terraform_remote_state" {
  bucket = "terraform-rs-bucket--anabroyan123456"
  tags   = merge(var.tags, { Name = "${var.project_name}-state-bucket123456" })
}

#Versioning
resource "aws_s3_bucket_versioning" "versioning_rs" {
  bucket = aws_s3_bucket.terraform_remote_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

#Encryption aws:kms
resource "aws_kms_key" "my_key" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encrypt_config" {
  bucket = aws_s3_bucket.terraform_remote_state.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.my_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

# Create DynamoDB table for state locks
resource "aws_dynamodb_table" "terraform_state_locks" {
  name         = "DynamoDB-table-state-locks123456"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = merge(var.tags, { Name = "${var.project_name}-State-Locks123456" })
}



# S3 Bucket Policy (Access Control)
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.terraform_remote_state.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          AWS = data.aws_iam_role.github_actions_role.arn
        }
        Action = [
          "s3:ListBucket",
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ]
        Resource = [
          "${aws_s3_bucket.terraform_remote_state.arn}",
          "${aws_s3_bucket.terraform_remote_state.arn}/*"
        ]
      }
    ]
  })
}

