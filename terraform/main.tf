# Create S3 Bucket

resource "aws_s3_bucket" "logs_bucket" {

  bucket = var.bucket_name

  tags = {
    Environment = "Dev"
    Project     = "DevOps-CICD"
  }

}


# Create SQS Queue

resource "aws_sqs_queue" "app_queue" {

  name = "devops-message-queue"

  visibility_timeout_seconds = 30

  tags = {
    Environment = "Dev"
    Project     = "DevOps-CICD"
  }

}


# Create DynamoDB Table

resource "aws_dynamodb_table" "app_table" {

  name         = "devops-users"
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "user_id"

  attribute {

    name = "user_id"
    type = "S"

  }

  tags = {
    Environment = "Dev"
    Project     = "DevOps-CICD"
  }

}