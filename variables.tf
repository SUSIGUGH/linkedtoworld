variable "vpc_id"{
type = string
 default = "vpc-00c9962d6840d8c99"
 description = "VPC for the Cluster"
}
variable "subnet_id"{
type = string
 default = "subnet-0594e3037f43c9d87"
 description = "Subnet for the Cluster"
}
variable "ec2_ami"{
type = string
default = "ami-026255a2746f88074"
}

