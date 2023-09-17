## test-1
module "common-vpc-environment-1" {

  source = "../../modules"

  common_app_name    = "test-1"
  provider_profile   = "leedonggyu"
  vpc_cidr           = "10.1.0.0/16"
  public_subnet_cidr = "10.1.1.0/24"
  region             = "ap-northeast-2"
  ec2_key_path       = "~/.ssh/id_rsa.pub"
}

## test-2
module "common-vpc-environment-2" {

  source = "../../modules"

  common_app_name    = "test-2"
  provider_profile   = "leedonggyu"
  vpc_cidr           = "10.2.0.0/16"
  public_subnet_cidr = "10.2.1.0/24"
  region             = "ap-northeast-2"
  ec2_key_path       = "~/.ssh/id_rsa.pub"
}

## test-3
module "common-vpc-environment-3" {

  source = "../../modules"

  common_app_name    = "test-3"
  provider_profile   = "leedonggyu"
  vpc_cidr           = "10.3.0.0/16"
  public_subnet_cidr = "10.3.1.0/24"
  region             = "ap-northeast-2"
  ec2_key_path       = "~/.ssh/id_rsa.pub"
}
