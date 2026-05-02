resource "aws_s3_bucket" "state_bucket" {
  bucket = "tf-pg-remote-state"
}
