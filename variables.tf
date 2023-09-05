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
  default     = ["subnet-0447b8df463aab190", "subnet-03288032898556035"]
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

