variable "env" {
  description = "This is the Environment Name. Eg: dev/stage/prod"
  type = string
}

variable "instance_type" {
  description = "This is the EC2 instance type. Eg: t2.micro"
  type = string
}

variable "instance_count" {
  description = "This is the number of EC2 instances to launch."
  type = number
}

variable "ami_id" {
  description = "This is the AMI ID to use for the EC2 instances."
  type = string
}

variable "volume_size" {
  description = "This is the size of the EBS volume in GB."
  type = number
}