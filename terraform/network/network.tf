resource "google_compute_network" "custom-panji-test" {
  name = "custom-panji-test"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "sub-sg" {
  name = "sub-sg"
  network = google_compute_network.custom-panji-test.id
  ip_cidr_range = "10.1.0.0/24"
  region = "asia-southeast1"
  private_ip_google_access = true

}