provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "7bd1c7d342082fc553ee7ba083ce109b0da0d984"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-11-30 21:29:12"
    git_last_modified_by = "lindsey.smith@gmail.com"
    git_modifiers        = "lindsey.smith"
    git_org              = "turbodog"
    git_repo             = "terragoat"
    yor_trace            = "636ca930-dfb0-4217-9421-3a7a35104afe"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "7bd1c7d342082fc553ee7ba083ce109b0da0d984"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-11-30 21:29:12"
    git_last_modified_by = "lindsey.smith@gmail.com"
    git_modifiers        = "lindsey.smith"
    git_org              = "turbodog"
    git_repo             = "terragoat"
    yor_trace            = "92eb8fdf-81b5-4b45-b266-55b6768a4c7c"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
