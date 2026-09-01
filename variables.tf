variable "instance_name" {
  description = "Name of ec2 instance"
  type = string
}
variable "ami" {
  description = "Amazon machine image to use for ec2 instance"
  type = string
}
variable "instance_type" {
  description = "ec2 instance type"
  type        = string
}
