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

resource "ibm_cos_bucket" "frontend_subnet_collector_bucket" {
  bucket_name          = "${var.name}-${var.zone}-frontend-subnet-collector-bucket"
  resource_instance_id = var.cos_instance
  region_location      = var.region
  storage_class        = "smart"
}

resource "ibm_cos_bucket" "backend_subnet_collector_bucket" {
  bucket_name          = "${var.name}-${var.zone}-backend-subnet-collector-bucket"
  resource_instance_id = var.cos_instance
  region_location      = var.region
  storage_class        = "smart"
}

resource "ibm_is_flow_log" "frontend_subnet_collector" {
  depends_on     = [ibm_cos_bucket.frontend_subnet_collector_bucket]
  bucket_name    = "${var.name}-${var.zone}-frontend-collector"
  target         = ibm_is_subnet.frontend.id
  active         = true
  storage_bucket = ibm_cos_bucket.frontend_subnet_collector_bucket.bucket_name
  resource_group = var.resource_group.id
  tags           = var.tags
}

resource "ibm_is_flow_log" "backend_subnet_collector" {
  depends_on     = [ibm_cos_bucket.backend_subnet_collector_bucket]
  bucket_name    = "${var.name}-${var.zone}-backend-collector"
  target         = ibm_is_subnet.backend.id
  active         = true
  storage_bucket = ibm_cos_bucket.backend_subnet_collector_bucket.bucket_name
  resource_group = var.resource_group.id
  tags           = var.tags
}