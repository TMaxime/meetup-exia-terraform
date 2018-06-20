variable "access_key" {
    description = "IAM account access key"
}
variable "secret_key" {
    description = "IAM account secret key"
}
variable "region" {
    description = "AWS region"
}

provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region = "${var.region}"
}
