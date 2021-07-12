# gke-iac-multiple-ways

Different approaches to creating GKE clusters with IaC tools, using Terraform, Terraform modules, and Ansible modules (possibly more after that). Nothing too original, mostly just going from the public docs for each one for practice. Right now only the basic Terraform one is finished, but will be adding the others soon.

ToDo:
- create GKE cluster using Terraform modules
- do the same using the Ansible module
- set up deployments for each one and push containers out

<h3>Terraform</h3>
Instructions:
Must have created a service account with the proper IAM permissions and downloaded 
https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/using_gke_with_terraform


<h3>Terraform Modules</h3>
https://registry.terraform.io/modules/terraform-google-modules/kubernetes-engine/google/latest


<h3>Ansible</h3>
https://docs.ansible.com/ansible/latest/collections/google/cloud/gcp_container_cluster_module.html
