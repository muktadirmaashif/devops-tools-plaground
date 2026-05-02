data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-kernel-6.1-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "test_server" {
  ami           = data.aws_ami.al2023.id
  instance_type = var.instance_type
  count         = var.instance_count

  tags = {
    name        = "${terraform.workspace}-server"
    environment = terraform.workspace
  }
}

