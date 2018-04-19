provider "aws" {
  access_key = "${var.AWS_Access_Key}"
  secret_key = "${var.AWS_Secret_Key}"
  region     = "${var.AWS_Default_Region}"
}
