variable "AWS_Access_Key" {}
variable "AWS_Secret_Key" {}
variable "AWS_Default_Region" {
  default = "us-east-1"
}
variable "AWS_VPC_ID" {
  default = "vpc-ea02f791"
}
variable "AWS_Default_AMI" {
  default = "ami-66506c1c"
}
variable "AWS_Default_Instance_Type" {
  default = "t2.micro"
}

variable "AWS_Default_Security_Group" {
  default = "sg-9e51dbe9"
}
