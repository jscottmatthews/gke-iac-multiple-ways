#variables

variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-cenral1-a"
}

variable "project" {
  description = "Project ID"
}

variable "credentials" {
  default = "key.json"
}


#provider

provider "google" {
    project     = var.project
    region      = var.region
    zone        = var.zone
    credentials = var.credentials
}


#infra

resource "google_service_account" "sa" {
    account_id = "gke-sa"
}

resource "google_container_cluster" "gke_cluster" {
    name                     = "gke-cluster"
    location                 = var.region
    initial_node_count       = 1

    network     = "default"
    subnetwork  = "default"

    ip_allocation_policy {
        cluster_ipv4_cidr_block   = "/16"
        services_ipv4_cidr_block  = "/22"
    } 
} 
