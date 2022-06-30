# ibmcloud-base-lab-vpc
Base Terraform code for a lab VPC environment

<!-- BEGIN_TF_DOCS -->

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_bastion"></a> [bastion](#module\_bastion) | we-work-in-the-cloud/vpc-bastion/ibm | n/a |
| <a name="module_dns"></a> [dns](#module\_dns) | ./modules/dns | n/a |
| <a name="module_flowlogs"></a> [flowlogs](#module\_flowlogs) | ./modules/flowlogs | n/a |
| <a name="module_security"></a> [security](#module\_security) | ./modules/security | n/a |
| <a name="module_zone"></a> [zone](#module\_zone) | ./modules/zone | n/a |

## Resources

| Name | Type |
|------|------|
| [ibm_is_vpc.lab](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.41.1/docs/resources/is_vpc) | resource |
| [ibm_resource_instance.cos](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.41.1/docs/resources/resource_instance) | resource |
| [ibm_resource_instance.dns](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.41.1/docs/resources/resource_instance) | resource |
| [ibm_is_image.os](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.41.1/docs/data-sources/is_image) | data source |
| [ibm_is_ssh_key.sshkey](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.41.1/docs/data-sources/is_ssh_key) | data source |
| [ibm_resource_group.project](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.41.1/docs/data-sources/resource_group) | data source |
| [ibm_resource_instance.cos](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.41.1/docs/data-sources/resource_instance) | data source |
| [ibm_resource_instance.dns](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.41.1/docs/data-sources/resource_instance) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_ssh_from"></a> [allow\_ssh\_from](#input\_allow\_ssh\_from) | IP address or CIDR block to allow SSH access from. If not specified, SSH access will be allowed from all IP addresses. | `string` | `"0.0.0.0/0"` | no |
| <a name="input_dns_zone"></a> [dns\_zone](#input\_dns\_zone) | DNS zone for VPC deployment. If not specified, a new DNS zone will be created. | `string` | n/a | yes |
| <a name="input_existing_cos_instance"></a> [existing\_cos\_instance](#input\_existing\_cos\_instance) | Name of an existing COS instance to use for configuring Flowlogs. If not specified, a new COS instance will be created. | `string` | n/a | yes |
| <a name="input_existing_dns_instance"></a> [existing\_dns\_instance](#input\_existing\_dns\_instance) | Name of an existing Private DNS instance to use for internal-VPC dns zones. If not specified, a new DNS instance will be created. | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Label that will be prefixed to all resources. Naming convention for resources: ${prefix}-vpc, ${prefix}-zone-1-subnet, etc. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | IBM Cloud Region where VPC resources will be deployed. To obtain a list of availability zones you can run the ibmcloud cli: ibmcloud is regions. | `string` | `"us-south"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of an existing Resource group to use for deployed resources. | `string` | n/a | yes |
| <a name="input_ssh_key_name"></a> [ssh\_key\_name](#input\_ssh\_key\_name) | Name of an existing SSH key in the VPC region. An SSH key is required to access the virtual instances: https://cloud.ibm.com/docs/vpc?topic=vpc-getting-started | `string` | n/a | yes |
| <a name="input_zones"></a> [zones](#input\_zones) | Default number of zones to create in the Region. | `number` | `3` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bastion_public_ip"></a> [bastion\_public\_ip](#output\_bastion\_public\_ip) | n/a |
<!-- END_TF_DOCS -->
