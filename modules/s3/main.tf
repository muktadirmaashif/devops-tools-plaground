data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

locals {
  s3_name = format("tf-pg-%s", data.aws_caller_identity.current.id)
}
