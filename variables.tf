variable "project_id" {
  type        = string
  description = "ID del proyecto en Google Cloud"
}

variable "region" {
  type        = string
  description = "Region principal de GCP para los recursos"
  default     = "us-central1"
}

variable "zone" {
  type        = string
  description = "Zona de GCP para la maquina virtual"
  default     = "us-central1-a"
}

variable "network_name" {
  type        = string
  description = "Nombre de la VPC"
  default     = "custom-vpc"
}

variable "subnet_name" {
  type        = string
  description = "Nombre de la subred"
  default     = "custom-subnet"
}

variable "subnet_cidr" {
  type        = string
  description = "Rango CIDR para la subred"
  default     = "10.0.1.0/24"
}

variable "allowed_ssh_cidr" {
  type        = list(string)
  description = "Rango de origen autorizado para conexiones SSH"
  default     = ["0.0.0.0/0"]
}

variable "allowed_http_cidr" {
  type        = list(string)
  description = "Rango de origen autorizado para conexiones HTTP"
  default     = ["0.0.0.0/0"]
}

variable "allowed_wireguard_cidr" {
  type        = list(string)
  description = "Rango de origen autorizado para trafico WireGuard (puerto 51820 UDP)"
  default     = ["0.0.0.0/0"]
}

variable "instance_name" {
  type        = string
  description = "Nombre de la maquina virtual"
  default     = "web-instance"
}

variable "machine_type" {
  type        = string
  description = "Tipo de maquina en Compute Engine"
  default     = "e2-micro"
}

variable "ssh_user" {
  type        = string
  description = "Usuario para la conexion SSH"
  default     = "camiseta77"
}

variable "ssh_pub_key" {
  type        = string
  description = "Clave publica SSH"
  default     = ""
}
