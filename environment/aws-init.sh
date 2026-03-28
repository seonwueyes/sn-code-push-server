# aws authentication init 
aws configure set aws_secret_access_key password
aws configure set default.s3.endpoint_url http://localhost:8333

# list bucket
aws s3 ls --endpoint-url http://localhost:8333

# create bucket
aws --endpoint-url http://localhost:8333 s3 mb s3://codepush
