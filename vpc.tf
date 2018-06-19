resource "aws_vpc" "main" {
    cidr_block = "${var.cidrs}"

    tags {
        Name = "MyVPC"
    }
}

resource "aws_subnet" "public_subnet" {
    vpc_id = "${aws_vpc.main.id}"
    availability_zone = "${var.availability_zone}"
    cidr_block = "${var.cidrs}"
    map_public_ip_on_launch = true

    tags {
        Name = "MySubnet"
    }
}

resource "aws_internet_gateway" "my_ig" {
    vpc_id = "${aws_vpc.main.id}"
}

resource "aws_route_table" "public_route" {
    vpc_id = "${aws_vpc.main.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.my_ig.id}"
    }

    tags {
        Name = "Public route table"
    }
}

resource "aws_route_table_association" "eu-west-3a-public" {
    subnet_id = "${aws_subnet.public_subnet.id}"
    route_table_id = "${aws_route_table.public_route.id}"
}