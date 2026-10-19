variable "instance_name" {
  type        = string
  description = "Nombre de la maquina virtual"
}

variable "machine_type" {
  type        = string
  description = "Tipo de maquina en Compute Engine"
  default     = "e2-micro"
}

variable "zone" {
  type        = string
  description = "Zona dentro de la region donde se ubicara la VM"
}

variable "subnet_id" {
  type        = string
  description = "ID o enlace de la subred a la que se conectara la VM"
}

variable "boot_image" {
  type        = string
  description = "Imagen de arranque del sistema operativo"
  default     = "debian-cloud/debian-13"
}

variable "disk_size_gb" {
  type        = number
  description = "Tamano del disco de arranque en GB"
  default     = 30
}

variable "region" {
  type        = string
  description = "Region donde se asignara la direccion IP estatica"
}

variable "ssh_user" {
  type        = string
  description = "Usuario para conexion SSH"
  default     = "camiseta77"
}

variable "ssh_pub_key" {
  type        = string
  description = "Clave publica SSH"
  default     = ""
}
