locals {

    subnet_id           = "subnet-xxxxx"
    vpc_id              = "vpc-xxxxx"
    stage               = "dev"
    instance_name       = "muvi-devops-test-01"
    number_of_instances = "1"
}

module "test-modules" {
    source  = "../."

    subnet              = local.subnet_id
    stage               = local.stage
    instance_name       = local.instance_name
    vpc_id              = local.vpc_id 
    number_of_instances = local.number_of_instances

}