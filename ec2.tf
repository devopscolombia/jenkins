provider "aws" {
  version = "~> 2.29"
  region = "eu-west-1"
  access_key = "AKIA5BAVCSOFEDAZX6UR"
  secret_key = "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"
}

data "aws_ami" "ubuntu" {
  most_recent = true

    filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["798582026253"]
}

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"

  }
output "ip"{
value= "${aws_instance.web.public_ip}"
}
