provider "aws" {
  alias   = "source"
  profile = "source-account-aws-profile"
  region  = "us-west-1"
}

provider "aws" {
  alias   = "dest"
  profile = "dest-account-aws-profile"
  region  = "us-east-1"
}

module "s3-cross-account-replication" {
  source             = "./modules/s3-cross-region-replication"
  source_bucket_name = "source-bucket-shubam-us-west-1"
  source_region      = "us-west-1"
  dest_bucket_name   = "dest-bucket-shubam-us-east-1"
  dest_region        = "us-east-1"

}
