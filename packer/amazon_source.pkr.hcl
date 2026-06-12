source "amazon-ebs" "ubuntu-ami" {
  profile       = "default"
  ami_name      = "${var.ami-name}"
  instance_type = "${var.aws-instance-type}"
  region        = "${var.aws-region}"
  ssh_username  = "${var.ssh-username}"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-jammy-22.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }

  tags = {
    Name        = "${var.ami-name}"
    Environment = "${var.environment}"
    CreatedBy   = "${var.author}"
    Project     = "${var.project}"
  }

  snapshot_tags = {
    Name      = "${var.ami-name}-snapshot"
    CreatedBy = "${var.author}"
  }

  run_tags = {
    Name      = "packer-builder-${var.ami-name}"
    Temporary = "true"
    CreatedBy = "${var.author}"
  }
}