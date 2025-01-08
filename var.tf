#Region, VPC, Subnet Id
variable "region"{
  default = "ap-southeast-1"
}
variable "vpc_id"{
  default = "vpc-0f9ecbeb4d10abe58"
  description = "Nonprod noncrit vpc-awslz02"
}
variable "subnet_id-zone_A" {
  default = "subnet-02064057555d3ffbc"
  description = "awslz02-420792623485-subnet-nonroutable1-ap-southeast-1a"
}
variable "subnet_id-zone_B" {
  default = "subnet-09de5cf9e5fdd03b1"
  description = "awslz02-420792623485-subnet-nonroutable2-ap-southeast-1b"
}


#Instance Variable
variable "instance_type"{
  default = "c7i.2xlarge"
}
variable "ami_id" {
  default = "ami-0d48cc5fec49b3da1"
}
variable "key_pair"{
    default = "bts-redis"
}
variable "iam_instance_profile" {
    default = "EC2_SSM_Role"
  
}


#Security Group Variable
variable "server_port" {
  description = "The port the server will use for HTTP requests"
  default = "8080"
}
variable "protocol" {
  description = "The port the server will use for HTTP requests"
  default = "tcp"
}
variable "cidr_range" {
  default = ["172.30.2.109/32", "172.30.2.107/32", "10.246.114.0/24"]
  description = "BTS UAT, SIT, VPC range"
}