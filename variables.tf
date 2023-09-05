variable "vpc_id" {
  description = "Chosse your vpc_id"
  type        = string
}
variable "stage" {
  description = "Chosse your stage"
  type        = string
}

variable "number_of_instances" {
  description = "number of instances to be created"
  type        = number
  default     = 1
}

variable "subnet_id" {
  description = "number of instances to be created"
  type        = list(string)
}

variable "ami_id" {
  description = "Chosse your ami_id"
  type        = string
  default     = "ami-053b0d53c279acc90"
}

variable "instance_type" {
  description = "Chosse your instance_type"
  type        = string
  default     = "t2.micro"
}
/*
variable "instance_name" {
  description = "Chosse your instance_name"
  type        = string
}
*/
