data "aws_iam_user" "muktadir" {
  user_name = "muktadir"
}

data "aws_iam_group" "devops" {
  group_name = "devops"
}

locals {
  user_in_devops = contains(
    data.aws_iam_group.devops.users,
    data.aws_iam_user.muktadir.user_name
  )
}

resource "null_resource" "assert_user_in_group" {
  lifecycle {
    precondition {
      condition     = local.user_in_devops
      error_message = "User is NOT a member of the devops group"
    }
  }
}

