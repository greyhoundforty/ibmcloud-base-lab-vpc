locals {
  tags = [
    "prefix:${var.prefix}"
  ]

  zones = var.zones
  vpc_zones = { for zone in range(local.zones) : zone => {
    zone = "${var.region}-${zone + 1}"
  } }

  cloud_image_name = "ibm-ubuntu-22-04-minimal-amd64-1"
  profile          = "cx2-2x4"
  dns_instance     = var.existing_dns_instance != "" ? data.ibm_resource_instance.dns.0.guid : ibm_resource_instance.dns.0.guid
  cos_instance     = var.existing_cos_instance != "" ? data.ibm_resource_instance.cos.0.id : ibm_resource_instance.cos.0.id
}

locals {
  user_data = <<-EOT
  #!/bin/bash
  set -x
  echo 'Acquire::ForceIPv4 "true";' | tee -a /etc/apt/apt.conf.d/99force-ipv4
  export DEBIAN_FRONTEND=noninteractive
  apt-get -qq -y update < /dev/null
  apt-get -qq -y upgrade < /dev/null
  apt-get -qq -y install build-essential curl wget python3-pip git jq < /dev/null
  EOT
}
