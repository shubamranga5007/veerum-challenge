# Solution

## S3 buckets with cross region replication (manual terraform)

1. terraform module `s3-cross-region-replication` created that creates s3 buckets with cross region replication.
2. main.tf invokes the module by passing source and destination bucket names and source and destination regions passed to the module to create the s3 resources.
3. To run:

  Assumption:
    Terraform installed
    AWS account created
    AWS credentials configured

  ```bash
  $ terraform init
  $ terraform plan
  $ terraform apply
  ```

## S3 buckets with cross region replication (via circle ci)

  1. .circleci/config.yaml has the pipeline workflow that uses terraform image in docker to run terraform and provision the s3 buckets in AWS.
  2. Prerequisites:
      1. Circle CI account
      2. The two environment variables for this project are AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY. These are variables that CircleCI uses to inject data into the .config.yml file. They need be be set when creating the pipeline.

## Script to enable replication for existing objects

  1. Configuring cross region replication takes effect only for new objects.
  2. For existing objects, `sync.py` syncs both the source and destination buckets of two different regions.
  3. `sync.py` python script uses boto3 to interact with AWS API, and it takes in two arguments `source_bucket` and `destination_bucket`.
  4. The script copies objects from source bucket that are not already in destination bucket.
  5. To run:
      Prerequisites:
        1. python2 installed
        2. boto3 libraries install (`pip install boto3`)
        3. AWS credentials configured in the machine

      ```bash
      $ python sync.py <source_bucket> <destination_bucket>
      ```
