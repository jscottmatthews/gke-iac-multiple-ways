#variables

variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-a"
}

variable "cluster_name" {
  default = "test-cluster"
}

variable "project" {
  description = "Project ID"
  type        = string
}


#provider

provider "google" {
  credentials = "./key.json"
  region      = var.region
  zone        = var.zone
  project     = var.project
}

data "google_client_config" "provider" {}

provider "kubernetes" {}


#net / subnet

resource "google_compute_network" "custom" {
  name                    = "gke-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "custom" {
  name          = "gke-subnetwork"
  ip_cidr_range = "10.10.0.0/16"
  region        = var.region
  network       = google_compute_network.custom.id
  secondary_ip_range = [
    {
      range_name    = "services-range"
      ip_cidr_range = "10.20.0.0/24"
    },
    {
      range_name    = "pod-range"
      ip_cidr_range = "10.30.0.0/20"
    }
  ]
}

#cluster

resource "google_container_cluster" "vpc_native_cluster" {
  name               = var.cluster_name
  location           = var.region
  initial_node_count = 1

  network    = google_compute_network.custom.id
  subnetwork = google_compute_subnetwork.custom.id

  ip_allocation_policy {
    cluster_secondary_range_name  = "pod-range"
    services_secondary_range_name = "services-range"
  }
}
