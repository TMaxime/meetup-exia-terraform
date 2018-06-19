variable "cidrs" {
    default = "192.168.1.0/24"
}
variable "availability_zone" {
    default = "my-az"
}

variable "ami" {
    default = "my-ami"
}

variable "key_pair" {
    default = "my-kp"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "instance_tag_name_1" {}
variable "instance_tag_name_2" {}