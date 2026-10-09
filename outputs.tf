output "vpc_name" {
  value       = module.vpc.network_name
  description = "Nombre de la VPC"
}

output "subnet_name" {
  value       = module.vpc.subnet_name
  description = "Nombre de la subred"
}

output "vm_instance_name" {
  value       = module.compute.instance_name
  description = "Nombre de la VM aprovisionada"
}

output "vm_internal_ip" {
  value       = module.compute.internal_ip
  description = "Direccion IP interna asignada a la VM"
}

output "vm_external_ip" {
  value       = module.compute.external_ip
  description = "Direccion IP publica asignada a la VM"
}
