output "network_id" {
  value       = google_compute_network.vpc.id
  description = "ID de la red VPC"
}

output "network_name" {
  value       = google_compute_network.vpc.name
  description = "Nombre de la red VPC"
}

output "subnet_id" {
  value       = google_compute_subnetwork.subnet.id
  description = "ID de la subred creada"
}

output "subnet_name" {
  value       = google_compute_subnetwork.subnet.name
  description = "Nombre de la subred creada"
}
