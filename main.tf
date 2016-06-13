#
# DO NOT DELETE THESE LINES!
#
# Your subnet ID is:
#
#     subnet-99a58be2
#
# Your security group ID is:
#
#     sg-8e08dfe6
#
# Your AMI ID is:
#
#     ami-74ee001b
#
# Your Identity is:
#
#     hashiconf-a87ff679a2f3e71d9181a67b7542122c
#
# Your AccessKeyID and SecretAccessKey are:
#
#     AKIAIL54SOM2Z4MA3WUA
#     RaIqsFkTQAI2Twk1wA6r/gIgVpjxzmjt3Gsrprzf
#

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {
  default = "eu-central-1"
}

provider "aws" {
  access_key = "AKIAIL54SOM2Z4MA3WUA"
  secret_key = "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"
  region     = "eu-central-1"
}

resource "aws_instance" "web" {
  ami = "ami-74ee001b"
  instance_type = "t2.micro"

  subnet_id  = "subnet-99a58be2"
  vpc_security_group_ids = ["sg-8e08dfe6"]

  tags {
    Identity = "hashiconf-a87ff679a2f3e71d9181a67b7542122c"
    tag1 = "parminder1"
    tag2 = "parminder2"
  }
}
output "public_ip" {
  value = "${join(", ", aws_instance.web.*.public_ip)}"
}

output "public_dns" {
  value = "${join(", ", aws_instance.web.*.public_dnsi)}"
}


