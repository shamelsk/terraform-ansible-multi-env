#dev-infra
module "dev-infra" {
    source = "./infra"
    env = "dev"
    instance_type = "t3.micro"
    instance_count = 1
    ami_id = "ami-091138d0f0d41ff90"
    volume_size = 8
}


#stage-infra
module "stg-infra" {
    source = "./infra"
    env = "stg"
    instance_type = "t3.micro"
    instance_count = 1
    ami_id = "ami-091138d0f0d41ff90"
    volume_size = 8
}

#prod-infra
module "prd-infra" {
    source = "./infra"
    env = "prd"
    instance_type = "t3.micro"
    instance_count = 1
    ami_id = "ami-091138d0f0d41ff90"
    volume_size = 8
}

output "dev_infra_instance_id" {
    value = module.dev-infra.ec2_public_ip
}

output "stg_infra_instance_id" {
    value = module.stg-infra.ec2_public_ip
}

output "prd_infra_instance_id" {
    value = module.prd-infra.ec2_public_ip
}   