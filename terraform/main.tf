terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.22.0"
    }
    google-beta = {
      source = "hashicorp/google-beta"
      version = "6.22.0"
    }  
  }

  backend "gcs" {
    credentials = "panji-test.json"
    bucket  = "panji-test"
    prefix  = "state"
  }
}

provider "google" {
  credentials = "panji-test.json"
}

provider "google-beta" {
  credentials = "panji-test.json"
}

module "compute" {
    source = "./ComputeInstance/"
}