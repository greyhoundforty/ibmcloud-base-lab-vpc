data "ibm_resource_group" "project" {
  name = var.resource_group_name
}

data "ibm_is_ssh_key" "sshkey" {
  name = var.ssh_key_name
}

data "ibm_is_image" "os" {
  name = local.cloud_image_name
}

data "ibm_resource_instance" "cos" {
  count             = var.existing_cos_instance != "" ? 1 : 0
  name              = var.existing_cos_instance
  location          = "global"
  service           = "cloud-object-storage"
  resource_group_id = data.ibm_resource_group.project.id
}

data "ibm_resource_instance" "dns" {
  count             = var.existing_dns_instance != "" ? 1 : 0
  name              = var.existing_dns_instance
  resource_group_id = data.ibm_resource_group.project.id
  service           = "dns-svcs"
}