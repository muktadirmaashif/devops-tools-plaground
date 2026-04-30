output "current_caller" {
  value = data.aws_caller_identity.current
}

output "current_region" {
  value = data.aws_region.current

}

output "bucket_name" {

  value = local.s3_name
}
