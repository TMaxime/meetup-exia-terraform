variable "cidrs" {
    description = "VPC cidr block"
}
variable "availability_zone" {
    description = "Default vailability zone"
}

variable "vpc_tag_name" {
    description = "Tag name of the VPC"
}

variable "subnet_tag_name" {
    description = "Tag name of the subnet"
}

variable "rtb_cidr" {
    description = "Route table cidr"
}

variable "rtb_tag_name" {
    description = "Tag name of the route table"
}

resource "aws_vpc" "main" {
    cidr_block = "${var.cidrs}"

    tags {
        Name = "${var.vpc_tag_name}"
    }
}

resource "aws_subnet" "public_subnet" {
    vpc_id = "${aws_vpc.main.id}"
    availability_zone = "${var.availability_zone}"
    cidr_block = "${var.cidrs}"

    tags {
        Name = "${var.subnet_tag_name}"
    }
}

resource "aws_internet_gateway" "my_ig" {
    vpc_id = "${aws_vpc.main.id}"
}

resource "aws_route_table" "public_route" {
    vpc_id = "${aws_vpc.main.id}"

    route {
        cidr_block = "${var.rtb_cidr}"
        gateway_id = "${aws_internet_gateway.my_ig.id}"
    }

    tags {
        Name = "${var.rtb_tag_name}"
    }
}

resource "aws_route_table_association" "eu-west-3a-public" {
    subnet_id = "${aws_subnet.public_subnet.id}"
    route_table_id = "${aws_route_table.public_route.id}"
}