output "instance_id" {
  value       = google_compute_instance.vm_instance.id
  description = "ID de la instancia creada"
}

output "instance_name" {
  value       = google_compute_instance.vm_instance.name
  description = "Nombre de la instancia"
}

output "internal_ip" {
  value       = google_compute_instance.vm_instance.network_interface[0].network_ip
  description = "Direccion IP interna asignada a la VM"
}

output "external_ip" {
  value       = google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip
  description = "Direccion IP publica asignada a la VM"
}
