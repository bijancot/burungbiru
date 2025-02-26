resource "google_compute_instance" "instance-test" {
  name = "instance-test"
  zone = "asia-southeast1-c"
  machine_type = "n1-standard-2"

  allow_stopping_for_update = true

  network_interface {
    network = "custom-vpc-tf"
    subnetwork = "sub-sg"
  }

  boot_disk {
    initialize_params {
      image = "debian-9-stretch-v20210916"
      size = 35
      
    }
    auto_delete = false
  }

  labels = {
    "tags" = "panji-test"
  }

  
  scheduling {
    preemptible = false
    automatic_restart = false
  }
  
  service_account {
    email = "terraform-gcp@<redacted>.iam.gserviceaccount.com"
    scopes = [ "cloud-platform" ]
  }

  lifecycle {
    ignore_changes = [
      attached_disk
    ]
  }

}

resource "google_compute_disk" "disk-1" {
  name = "disk-1"
  size = 15
  zone = "asia-southeast1-c"
  type = "pd-ssd"
}

resource "google_compute_attached_disk" "default" {
  disk = google_compute_disk.disk-1.id
  instance = google_compute_instance.instance-test.id
}

