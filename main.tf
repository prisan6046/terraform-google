provider "google" {
  project = "bustling-kayak-258808"
  region  = "asia-southeast1"
  zone    = "asia-southeast1-c"
}



resource "google_compute_instance" "webserver" {
  name         = "webserver"
  machine_type = "n1-standard-1"

  boot_disk {
    auto_delete = true
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1604-lts"
    }
  }

  metadata_startup_script = "${file("./startup.sh")}"

  network_interface {
    network = "default"

    access_config {
    }
  }

  metadata = {
    sshKeys = "ubuntu:${file(var.ssh_public_key_filepath)}"
  }

  tags = ["http-server" ,"all-port" , "default-allow-ssh"]
}

resource "google_compute_firewall" "all-port" {
 name    = "all-port"
 network = "default"

 allow {
   protocol = "tcp"
   ports    = ["6443" , "10250" , "0-65535"]
 }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["all-port"]

}

resource "google_compute_firewall" "http-server" {
  name    = "default-allow-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}
