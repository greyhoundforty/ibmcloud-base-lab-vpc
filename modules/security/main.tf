resource "ibm_is_security_group" "backend" {
  name           = "${var.name}-backend-sg"
  vpc            = var.vpc.id
  resource_group = var.resource_group.id
  tags           = var.tags
}

resource "ibm_is_security_group_rule" "backend_inbound_all" {
  group     = ibm_is_security_group.backend.id
  direction = "inbound"
}
resource "ibm_is_security_group_rule" "backend_outbound_all" {
  group     = ibm_is_security_group.backend.id
  direction = "outbound"
}