resource "google_compute_address" "static_ip" {
  name         = "${var.instance_name}-ip"
  region       = var.region
  network_tier = "STANDARD"
}

resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  tags = ["ssh-enabled", "http-server", "wireguard-server"]

  boot_disk {
    initialize_params {
      image = var.boot_image
      size  = var.disk_size_gb
      type  = "pd-standard"
    }
  }

  network_interface {
    subnetwork = var.subnet_id

    access_config {
      nat_ip       = google_compute_address.static_ip.address
      network_tier = "STANDARD"
    }
  }

  metadata = {
    enable-oslogin = var.ssh_pub_key != "" ? "FALSE" : "TRUE"
    ssh-keys       = var.ssh_pub_key != "" ? "${var.ssh_user}:${var.ssh_pub_key}" : null
  }
}
