# Azure Sentinel Data Connector Office 365 Module Overlay

[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![MIT License](https://img.shields.io/badge/license-MIT-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/azurenoops/overlays-sentinel/azurerm/)

This Overlay terraform module can create Sentinel Data Connector Office 365 and manage related parameters to be used in a [SCCA compliant Network](https://registry.terraform.io/modules/azurenoops/overlays-management-hub/azurerm/latest).

## SCCA Compliance

This module can be SCCA compliant and can be used in a SCCA compliant Network. Enable private endpoints and SCCA compliant network rules to make it SCCA compliant.

For more information, please read the [SCCA documentation](https://docs.microsoft.com/en-us/azure/azure-government/documentation-government-get-started-connect-with-cli).

## Example Usage

```hcl  
module "sentinel_connector_O365" {  
  source = "azurenoops/overlays-sentinel-rules/azurerm//modules/sentinel_connectors/office365"  
  version = "x.x.x"  
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
| [azurerm_sentinel_data_connector_office_365.dataO365](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_data_connector_office_365) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_exchange_connector"></a> [enable\_exchange\_connector](#input\_enable\_exchange\_connector) | (Optional) Whether to enable the Exchange connector be enabled. Defaults to true. | `bool` | `true` | no |
| <a name="input_enable_sharepoint_connector"></a> [enable\_sharepoint\_connector](#input\_enable\_sharepoint\_connector) | (Optional) Whether to enable the SharePoint connector be enabled. Defaults to true. | `bool` | `true` | no |
| <a name="input_enable_teams_connector"></a> [enable\_teams\_connector](#input\_enable\_teams\_connector) | (Optional) Whether to enable the Teams connector be enabled. Defaults to true. | `bool` | `true` | no |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | (Required) The ID of the Log Analytics Workspace to which the connector should be attached. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sentinel_connector_o365_id"></a> [sentinel\_connector\_o365\_id](#output\_sentinel\_connector\_o365\_id) | n/a |
| <a name="output_sentinel_connector_o365_name"></a> [sentinel\_connector\_o365\_name](#output\_sentinel\_connector\_o365\_name) | n/a |
<!-- END_TF_DOCS -->