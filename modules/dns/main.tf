

# resource "ibm_dns_zone" "lab" {
#   name        = "v1.lab"
#   instance_id = ibm_resource_instance.dns.guid
#   description = "DNS zone used for GSLB and all instances"
#   label       = "this-is-a-label"
# }

# resource "ibm_dns_permitted_network" "vpc" {
#   instance_id = ibm_resource_instance.dns.guid
#   zone_id     = ibm_dns_zone.lab.zone_id
#   vpc_crn     = var.vpc_crn
#   type        = "vpc"
# }

# resource "ibm_dns_glb_monitor" "cloud" {
#   depends_on  = [ibm_dns_zone.lab]
#   name        = var.prefix
#   instance_id = ibm_resource_instance.dns.guid
#   description = "Monitor for Consul cluster port"
#   interval    = 60
#   retries     = 2
#   # timeout        = default is good
#   port           = 8500
#   type           = "TCP"
#   expected_codes = "200"
#   path           = "/"
#   method         = "GET"
# }
