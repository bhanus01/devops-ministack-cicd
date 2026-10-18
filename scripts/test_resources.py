import boto3


endpoint = "http://localhost:4566"

credentials = {
    "aws_access_key_id": "test",
    "aws_secret_access_key": "test",
    "region_name": "us-east-1",
    "endpoint_url": endpoint
}


# Test S3

s3 = boto3.client("s3", **credentials)

buckets = s3.list_buckets()

bucket_names = []

for bucket in buckets["Buckets"]:
    bucket_names.append(bucket["Name"])

assert "devops-demo-bucket" in bucket_names

print("S3 bucket test passed")


# Test SQS

sqs = boto3.client("sqs", **credentials)

queues = sqs.list_queues()

queue_urls = queues.get("QueueUrls", [])

queue_found = False

for queue in queue_urls:

    if "devops-message-queue" in queue:
        queue_found = True

assert queue_found

print("SQS queue test passed")


# Test DynamoDB

dynamodb = boto3.client("dynamodb", **credentials)

tables = dynamodb.list_tables()

assert "devops-users" in tables["TableNames"]

print("DynamoDB table test passed")


print("All infrastructure tests passed")