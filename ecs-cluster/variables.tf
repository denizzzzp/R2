variable "ami_id" {}
variable "ami_id_docker" {}


variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "ecs_cluster" {
  description = "ECS cluster name"
#  default = "ECS_cluster"
}

variable "ecs_key_pair_name" {
  description = "ECS key pair name"
}

variable "region" {
  description = "AWS region"
#  default = "eu-central-1"
}

variable "availability_zone" {
  description = "availability zone used for the demo, based on region"
  default = {
    us-east-1 = "us-east-1"
  }
}

########################### Test VPC Config ################################

variable "test_vpc" {
  description = "VPC for Test environment"
}

variable "test_network_cidr" {
  description = "IP addressing for Test Network"
}

variable "test_public_01_cidr" {
  description = "Public 0.0 CIDR for externally accessible subnet"
}

variable "test_public_02_cidr" {
  description = "Public 0.0 CIDR for externally accessible subnet"
}

########################### Autoscale Config ################################

variable "max_instance_size" {
  description = "Maximum number of instances in the cluster"
#  default = 4
}

variable "min_instance_size" {
  description = "Minimum number of instances in the cluster"
#  default = 1
}

variable "desired_capacity" {
  description = "Desired number of instances in the cluster"
#  default = 2
}

##################################

variable "down_alarm_threshold" { default = "10" }
variable "up_alarm_threshold" { default = "80" }
