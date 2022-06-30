<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | 1.41.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ibm"></a> [ibm](#provider\_ibm) | 1.41.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [ibm_cos_bucket.backend_subnet_collector_bucket](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.41.1/docs/resources/cos_bucket) | resource |
| [ibm_cos_bucket.frontend_subnet_collector_bucket](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.41.1/docs/resources/cos_bucket) | resource |
| [ibm_is_flow_log.backend_subnet_collector](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.41.1/docs/resources/is_flow_log) | resource |
| [ibm_is_flow_log.frontend_subnet_collector](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.41.1/docs/resources/is_flow_log) | resource |
| [ibm_is_public_gateway.frontend](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.41.1/docs/resources/is_public_gateway) | resource |
| [ibm_is_subnet.backend](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.41.1/docs/resources/is_subnet) | resource |
| [ibm_is_subnet.frontend](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.41.1/docs/resources/is_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | n/a | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `any` | n/a | yes |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | n/a | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `any` | n/a | yes |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | resources ibm\_is\_* | `any` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backend_subnet_id"></a> [backend\_subnet\_id](#output\_backend\_subnet\_id) | n/a |
| <a name="output_frontend_subnet_id"></a> [frontend\_subnet\_id](#output\_frontend\_subnet\_id) | n/a |
<!-- END_TF_DOCS -->