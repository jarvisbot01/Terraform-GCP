resource "google_compute_network" "vpc" {
  name                    = var.network_name
  auto_create_subnetworks = false
  description             = "VPC personalizada administrada por Terraform"
}

resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc.id
  description   = "Subred principal para Compute Engine"
}

resource "google_compute_route" "default_internet_gateway" {
  name             = "${var.network_name}-default-internet-route"
  dest_range       = "0.0.0.0/0"
  network          = google_compute_network.vpc.name
  next_hop_gateway = "default-internet-gateway"
  priority         = 1000
  description      = "Ruta hacia el Internet Gateway por defecto"
}

resource "google_compute_firewall" "allow_ssh" {
  name        = "${var.network_name}-allow-ssh"
  network     = google_compute_network.vpc.name
  description = "Permitir trafico SSH entrante"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = var.allowed_ssh_cidr
  target_tags   = ["ssh-enabled"]
}

resource "google_compute_firewall" "allow_http" {
  name        = "${var.network_name}-allow-http"
  network     = google_compute_network.vpc.name
  description = "Permitir trafico HTTP entrante desde Internet"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = var.allowed_http_cidr
  target_tags   = ["http-server"]
}

resource "google_compute_firewall" "allow_wireguard" {
  name        = "${var.network_name}-allow-wireguard"
  network     = google_compute_network.vpc.name
  description = "Permitir trafico WireGuard VPN (puerto 51820 UDP)"

  allow {
    protocol = "udp"
    ports    = ["51820"]
  }

  source_ranges = var.allowed_wireguard_cidr
  target_tags   = ["wireguard-server"]
}

resource "google_compute_firewall" "allow_internal" {
  name        = "${var.network_name}-allow-internal"
  network     = google_compute_network.vpc.name
  description = "Permitir trafico interno entre recursos de la subred"

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "icmp"
  }

  source_ranges = [var.subnet_cidr]
}
