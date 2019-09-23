provider "aws" {
  version = "~> 2.29"
  region = "eu-west-1"
  access_key = "AKIA5BAVCSOFEDAZX6UR"
  secret_key = "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"
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners = ["895544890250"]

    filter {
    name   = "virtualization-type"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenaial-16.04-amd64-server-*"]
  }

  }

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"

  }
output "ip"{
value= "${aws_instance.web.public_ip}"
}
