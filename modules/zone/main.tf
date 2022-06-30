resource "ibm_is_public_gateway" "frontend" {
  name           = "${var.name}-public-gateway"
  vpc            = var.vpc.id
  zone           = var.zone
  resource_group = var.resource_group.id
  tags           = concat(var.tags, ["zone:${var.zone}", "network-tier:frontend"])

}

resource "ibm_is_subnet" "frontend" {
  name                     = "${var.name}-frontend-subnet"
  resource_group           = var.resource_group.id
  vpc                      = var.vpc.id
  zone                     = var.zone
  total_ipv4_address_count = "64"
  public_gateway           = ibm_is_public_gateway.frontend.id
  tags                     = concat(var.tags, ["zone:${var.zone}", "network-tier:frontend"])
}

resource "ibm_is_subnet" "backend" {
  name                     = "${var.name}-backend-subnet"
  resource_group           = var.resource_group.id
  vpc                      = var.vpc.id
  zone                     = var.zone
  total_ipv4_address_count = "256"
  tags                     = concat(var.tags, ["zone:${var.zone}", "network-tier:backend"])
}

