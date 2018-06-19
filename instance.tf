resource "aws_eip_association" "eip-1" {
    instance_id = "${aws_instance.instance-1.id}"
    allocation_id = "eipalloc-09c08b100e10c7bff"
}


resource "aws_instance" "instance-1" {
    ami = "${var.ami}"
    instance_type = "${var.instance_type}"
    subnet_id = "${aws_subnet.public_subnet.id}"
    vpc_security_group_ids = ["${aws_security_group.public-sg.id}"]
    key_name = "${var.key_pair}"

    tags {
        Name = "${var.instance_tag_name}"
    }
}


resource "aws_eip_association" "eip-2" {
    instance_id = "${aws_instance.instance-2.id}"
    allocation_id = "eipalloc-0fa555408f0fa2119"
}


resource "aws_instance" "instance-2" {
    ami = "${var.ami}"
    instance_type = "${var.instance_type}"
    subnet_id = "${aws_subnet.public_subnet.id}"
    vpc_security_group_ids = ["${aws_security_group.public-sg.id}"]
    key_name = "${var.key_pair}"

    tags {
        Name = "${var.instance_tag_name}"
    }
}