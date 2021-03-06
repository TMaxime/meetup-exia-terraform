#
#provider.tf variables
access_key              = ""
secret_key              = ""
region                  = "eu-west-3"


#
#vpc.tf variables
cidrs                   = "192.168.1.0/24"
availability_zone       = "eu-west-3a"
vpc_tag_name            = "MyVpc"
subnet_tag_name         = "MySubnet"
igw_tag_name            = "MyIgw"
rtb_cidr                = "0.0.0.0/0"
rtb_tag_name            = "MyRtb"


#
#instance.tf variables
ami                     = "ami-9a19aee7"
key_pair                = ""
instance_type           = "t2.micro"
instance_tag_name_1     = "instance-1"
instance_tag_name_2     = "instance-2"
