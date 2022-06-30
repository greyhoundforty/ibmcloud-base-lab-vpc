variable "prefix" {
  type        = string
  description = "Label that will be prefixed to all resources. Naming convention for resources: $${prefix}-vpc, $${prefix}-zone-1-subnet, etc."
}

variable "resource_group_name" {
  type        = string
  description = "Name of an existing Resource group to use for deployed resources."
}

variable "ssh_key_name" {
  type        = string
  description = "Name of an existing SSH key in the VPC region. An SSH key is required to access the virtual instances: https://cloud.ibm.com/docs/vpc?topic=vpc-getting-started"
}

variable "region" {
  type        = string
  description = "IBM Cloud Region where VPC resources will be deployed. To obtain a list of availability zones you can run the ibmcloud cli: ibmcloud is regions."
  default     = "us-south"
}

variable "zones" {
  type        = number
  description = "Default number of zones to create in the Region."
  default     = 3
}

variable "allow_ssh_from" {
  type        = string
  description = "IP address or CIDR block to allow SSH access from. If not specified, SSH access will be allowed from all IP addresses."
  default     = "0.0.0.0/0"
}

variable "existing_cos_instance" {
  type        = string
  description = "Name of an existing COS instance to use for configuring Flowlogs. If not specified, a new COS instance will be created."
}

variable "existing_dns_instance" {
  type        = string
  description = "Name of an existing Private DNS instance to use for internal-VPC dns zones. If not specified, a new DNS instance will be created."
}

variable "dns_zone" {
  type        = string
  description = "DNS zone for VPC deployment. If not specified, a new DNS zone will be created."
}
