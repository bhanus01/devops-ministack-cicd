output "s3_bucket_name" {

  value = aws_s3_bucket.app_bucket.id

}

output "sqs_queue_url" {

  value = aws_sqs_queue.app_queue.url

}

output "dynamodb_table_name" {

  value = aws_dynamodb_table.app_table.name

}