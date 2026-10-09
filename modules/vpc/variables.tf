variable "network_name" {
  type        = string
  description = "Nombre de la VPC"
}

variable "subnet_name" {
  type        = string
  description = "Nombre de la subred"
}

variable "subnet_cidr" {
  type        = string
  description = "Rango CIDR asignado a la subred"
}

variable "region" {
  type        = string
  description = "Region donde se creara la subred"
}

variable "allowed_ssh_cidr" {
  type        = list(string)
  description = "Rangos de red autorizados para conectar por SSH"
  default     = ["0.0.0.0/0"]
}

variable "allowed_http_cidr" {
  type        = list(string)
  description = "Rangos de red autorizados para trafico HTTP"
  default     = ["0.0.0.0/0"]
}

variable "allowed_wireguard_cidr" {
  type        = list(string)
  description = "Rangos de red autorizados para trafico WireGuard (puerto 51820 UDP)"
  default     = ["0.0.0.0/0"]
}

