# Azure Sentinel Data Connector Azure Security Center Module Overlay

[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![MIT License](https://img.shields.io/badge/license-MIT-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/azurenoops/overlays-sentinel/azurerm/)

This Overlay terraform module can create Sentinel Data Connector Azure Security Center and manage related parameters to be used in a [SCCA compliant Network](https://registry.terraform.io/modules/azurenoops/overlays-management-hub/azurerm/latest).

## SCCA Compliance

This module can be SCCA compliant and can be used in a SCCA compliant Network. Enable private endpoints and SCCA compliant network rules to make it SCCA compliant.

For more information, please read the [SCCA documentation](https://docs.microsoft.com/en-us/azure/azure-government/documentation-government-get-started-connect-with-cli).

## Example Usage

```hcl  
module "sentinel_connector_AAD" {  
  source = "azurenoops/overlays-sentinel-rules/azurerm//modules/sentinel_connector/asc"  
  version = "0.1.0"  
  log_analytics_workspace_id = module.mod_hub_network.managmement_logging_log_analytics_id
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.36 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.36 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_sentinel_data_connector_azure_security_center.dataASC](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_data_connector_azure_security_center) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | (Required) The ID of the Log Analytics Workspace to which the connector should be attached. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sentinel_connector_asc_id"></a> [sentinel\_connector\_asc\_id](#output\_sentinel\_connector\_asc\_id) | n/a |
| <a name="output_sentinel_connector_asc_name"></a> [sentinel\_connector\_asc\_name](#output\_sentinel\_connector\_asc\_name) | n/a |
<!-- END_TF_DOCS -->