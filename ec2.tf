provider "aws" {
  version = "~> 2.29"
  region = "eu-west-1"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

data "aws_ami" "ubuntu" {
  most_recent = true

    filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["895544890250"]
}

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"

  tags {
    Name = "HelloWorld"
  }
}
output "ip"{
value= "${aws_instance.web.public_ip}"
}
