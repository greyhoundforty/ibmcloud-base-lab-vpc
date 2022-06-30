resource "ibm_is_vpc" "lab" {
  name           = "${var.prefix}-vpc"
  resource_group = data.ibm_resource_group.project.id
  tags           = concat(local.tags, ["region:${var.region}"])
}

resource "ibm_resource_instance" "dns" {
  count             = var.existing_dns_instance != "" ? 1 : 0
  name              = "${var.prefix}-dns"
  resource_group_id = data.ibm_resource_group.project.id
  location          = "global"
  service           = "dns-svcs"
  plan              = "standard-dns"
  tags              = local.tags
}

resource "ibm_resource_instance" "cos" {
  count             = var.existing_cos_instance != "" ? 1 : 0
  name              = "${var.prefix}-cos"
  resource_group_id = data.ibm_resource_group.project.id
  location          = "global"
  service           = "cloud-object-storage"
  plan              = "standard"
  tags              = local.tags
}


module "zone" {
  for_each = local.vpc_zones
  source   = "./modules/zone"
  name     = "${var.prefix}-${each.value.zone}"
  zone     = each.value.zone
  region   = var.region
  vpc      = { id = ibm_is_vpc.lab.id }
  resource_group = {
    id = data.ibm_resource_group.project.id
  }
  tags = concat(local.tags, ["region:${var.region}"])
  cos_instance = local.cos_instance
}

module "security" {
  source = "./modules/security"
  name   = var.prefix
  vpc = {
    id = ibm_is_vpc.lab.id
  }
  resource_group = {
    id = data.ibm_resource_group.project.id
  }
  tags = concat(local.tags, ["region:${var.region}"])
}

module "bastion" {
  source = "we-work-in-the-cloud/vpc-bastion/ibm"

  vpc_id            = ibm_is_vpc.lab.id
  resource_group_id = data.ibm_resource_group.project.id
  name              = "${var.prefix}-${local.vpc_zones.0.zone}-bastion"
  ssh_key_ids       = [data.ibm_is_ssh_key.sshkey.id]
  subnet_id         = module.zone[0].frontend_subnet_id
  create_public_ip  = true
  allow_ssh_from    = var.allow_ssh_from
  tags              = concat(local.tags, ["region:${var.region}", "zone:${local.vpc_zones.0.zone}"])
}

module "dns" {
  source       = "./modules/dns"
  dns_instance = local.dns_instance
  vpc_crn      = ibm_is_vpc.lab.crn
}

module "flowlogs" {
  source = "./modules/flowlogs"
}
