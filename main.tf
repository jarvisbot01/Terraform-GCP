module "vpc" {
  source = "./modules/vpc"

  network_name     = var.network_name
  subnet_name      = var.subnet_name
  subnet_cidr      = var.subnet_cidr
  region           = var.region
  allowed_ssh_cidr  = var.allowed_ssh_cidr
  allowed_http_cidr = var.allowed_http_cidr
  allowed_wireguard_cidr = var.allowed_wireguard_cidr
}

module "compute" {
  source = "./modules/compute"

  instance_name = var.instance_name
  machine_type  = var.machine_type
  zone          = var.zone
  region        = var.region
  subnet_id     = module.vpc.subnet_id
  ssh_user      = var.ssh_user
  ssh_pub_key   = var.ssh_pub_key
}
