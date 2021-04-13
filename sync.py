import sys
import boto3

s3 = boto3.resource('s3', verify=False)

source_bucket = s3.Bucket(sys.argv[1])
destination_bucket = s3.Bucket(sys.argv[2])

destination_keys = [object.key for object in destination_bucket.objects.all()]

for object in source_bucket.objects.all():
    if (object.key not in destination_keys):
        destination_bucket.copy({'Bucket': sys.argv[1], 'Key': object.key}, object.key)
