resource "ibm_dns_zone" "lab" {
  name        = "v1.lab"
  instance_id = var.dns_instance
  description = "DNS zone used for GSLB and all instances"
  label       = "this-is-a-label"
}

resource "ibm_dns_permitted_network" "vpc" {
  instance_id = var.dns_instance
  zone_id     = ibm_dns_zone.lab.zone_id
  vpc_crn     = var.vpc_crn
  type        = "vpc"
}
