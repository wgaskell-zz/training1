
# DO NOT DELETE THESE LINES!
#
# Your DNSimple email is:
#
#     sethvargo+terraform@gmail.com
#
# Your DNSimple token is:
#
#     1Gam3SE2eIwZYtq70H5V5iAXiE9sGPmf
#
# Your Identity is:
#
#     hashiconf-a87ff679a2f3e71d9181a67b7542122c
#
provider "dnsimple" {
  email = "sethvargo+terraform@gmail.com"
  token = "1Gam3SE2eIwZYtq70H5V5iAXiE9sGPmf"
}

resource "dnsimple_record" "example" {
  domain = "terraform.rocks"
  type = "A"
  name = "parminder"
  value = "${aws_instance.web.0.public_ip}"
}
