# gke-iac-multiple-ways

Different approaches to creating GKE clusters with IaC tools, using Terraform, Terraform modules, and Ansible modules (possibly more after that). Nothing too original, mostly just going from the public docs for each one for practice. Right now only the basic Terraform one is finished, but will be adding the others soon.

ToDo:
- create GKE cluster using Terraform modules
- do the same using the Ansible module
- set up deployments for each one and push containers out

<h3>Terraform</h3>
Instructions:

Create a service account with the proper IAM permissions

    git clone https://github.com/jscottmatthews/gke-iac-multiple-ways.git
    cd gke-iac-multiple-ways/terraform/

Download a key for the SA into the same directory and call it key.json (otherwise modify the code to specify the file's name / path). Then run the following commands (you will be asked for your project ID)

    terraform init 
    terraform plan 
    terraform apply

Reference: 
https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/using_gke_with_terraform


<h3>Terraform Modules</h3>
https://registry.terraform.io/modules/terraform-google-modules/kubernetes-engine/google/latest


<h3>Ansible</h3>
https://docs.ansible.com/ansible/latest/collections/google/cloud/gcp_container_cluster_module.html
