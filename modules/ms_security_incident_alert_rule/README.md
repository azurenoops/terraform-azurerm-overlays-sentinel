# Azure Sentinel Microsoft Security Incident Alert Rule Module Overlay

[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![MIT License](https://img.shields.io/badge/license-MIT-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/azurenoops/overlays-sentinel/azurerm/)

This Overlay terraform module can create Sentinel Microsoft Security Incident Rules and manage related parameters to be used in a [SCCA compliant Network](https://registry.terraform.io/modules/azurenoops/overlays-management-hub/azurerm/latest).

## SCCA Compliance

This module can be SCCA compliant and can be used in a SCCA compliant Network. Enable private endpoints and SCCA compliant network rules to make it SCCA compliant.

For more information, please read the [SCCA documentation](https://docs.microsoft.com/en-us/azure/azure-government/documentation-government-get-started-connect-with-cli).

## Example Usage

```hcl  
module "sentinel_ms_security_incident_alert_rule" {  
  source = "azurenoops/overlays-sentinel/azurerm//modules/ms_security_incident_alert_rule"  
  version = "~> x.x.x"  
  
    product_filter             = "Azure Security Center"
    display_name               = "Create incidents based on all alerts generated in Azure Security Center"
    severity_filter            = ["High"]
    alert_rule_template_guid   = "90586451-7ba8-4c1e-9904-7d1b7c3cc4d6"
    description                = "Create incidents based on Azure Security Center alerts"
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
| [azurerm_sentinel_alert_rule_ms_security_incident.sentinel_alert_rule_ms_security_incident](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_alert_rule_ms_security_incident) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alert_rule_template_guid"></a> [alert\_rule\_template\_guid](#input\_alert\_rule\_template\_guid) | The GUID of the alert rule template to use. This is the GUID of the alert rule template in the Azure Sentinel workspace. | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | The description of the alert rule. | `string` | n/a | yes |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | The display name of the alert rule. | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | The ID of the Log Analytics workspace in which Azure Sentinel is deployed. | `string` | n/a | yes |
| <a name="input_product_filter"></a> [product\_filter](#input\_product\_filter) | The product filter to use for the alert rule. This is the product filter in the alert rule template in the Azure Sentinel workspace. | `string` | n/a | yes |
| <a name="input_severity_filter"></a> [severity\_filter](#input\_severity\_filter) | The severity filter to use for the alert rule. This is the severity filter in the alert rule template in the Azure Sentinel workspace. | `set(string)` | <pre>[<br>  "High"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the alert rule. |
<!-- END_TF_DOCS -->