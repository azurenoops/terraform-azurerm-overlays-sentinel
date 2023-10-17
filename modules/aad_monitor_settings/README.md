# Azure Sentinel Azure Active Directory Dianostics Settings Module Overlay

[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![MIT License](https://img.shields.io/badge/license-MIT-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/azurenoops/overlays-sentinel/azurerm/)

This Overlay terraform module can create Sentinel Azure Active Directory Dianostics Settings and manage related parameters to be used in a [SCCA compliant Network](https://registry.terraform.io/modules/azurenoops/overlays-management-hub/azurerm/latest).

## SCCA Compliance

This module can be SCCA compliant and can be used in a SCCA compliant Network. Enable private endpoints and SCCA compliant network rules to make it SCCA compliant.

For more information, please read the [SCCA documentation](https://docs.microsoft.com/en-us/azure/azure-government/documentation-government-get-started-connect-with-cli).

## Example Usage

```hcl  
module "mod_sentinel_aad_monitor_settings" {
  #source = "azurenoops/overlays-sentinel/azurerm//modules/aad_monitor_settings"  
  #version = "x.x.x"  
  
  log_analytics_workspace_id = azurerm_log_analytics_workspace.sentinel_workspace.id
  log_analytics_storage_account_id = azurerm_storage_account.sentinel_storage_account.id

  enable_sign_in_logs = true
  enable_audit_logs = true
  enable_non_interactive_user_sign_in_logs = true
  enable_service_principal_sign_in_logs = true
  enable_managed_identity_sign_in_logs = true
  enable_provisioning_logs = true
  enable_adfs_sign_in_logs = true
  enable_user_risk_events = true
  enable_risky_events = true

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
| [azurerm_monitor_aad_diagnostic_setting.aad_diagnostic_settings](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_aad_diagnostic_setting) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_adfs_sign_in_logs"></a> [enable\_adfs\_sign\_in\_logs](#input\_enable\_adfs\_sign\_in\_logs) | Enable Azure Active Directory ADFS Sign In Logs in Sentinel | `bool` | `false` | no |
| <a name="input_enable_audit_logs"></a> [enable\_audit\_logs](#input\_enable\_audit\_logs) | Enable Azure Active Directory Audit Logs in Sentinel | `bool` | `false` | no |
| <a name="input_enable_managed_identity_sign_in_logs"></a> [enable\_managed\_identity\_sign\_in\_logs](#input\_enable\_managed\_identity\_sign\_in\_logs) | Enable Azure Active Directory Managed Identity Sign In Logs in Sentinel | `bool` | `false` | no |
| <a name="input_enable_network_access_traffic_logs"></a> [enable\_network\_access\_traffic\_logs](#input\_enable\_network\_access\_traffic\_logs) | Enable Azure Active Directory Network Access Traffic Logs in Sentinel | `bool` | `false` | no |
| <a name="input_enable_non_interactive_user_sign_in_logs"></a> [enable\_non\_interactive\_user\_sign\_in\_logs](#input\_enable\_non\_interactive\_user\_sign\_in\_logs) | Enable Azure Active Directory Non Interactive User Sign In Logs in Sentinel | `bool` | `false` | no |
| <a name="input_enable_provisioning_logs"></a> [enable\_provisioning\_logs](#input\_enable\_provisioning\_logs) | Enable Azure Active Directory Provisioning Logs in Sentinel | `bool` | `false` | no |
| <a name="input_enable_risky_events"></a> [enable\_risky\_events](#input\_enable\_risky\_events) | Enable Azure Active Directory Risky Events in Sentinel | `bool` | `false` | no |
| <a name="input_enable_risky_service_principals"></a> [enable\_risky\_service\_principals](#input\_enable\_risky\_service\_principals) | Enable Azure Active Directory Risky Service Principals in Sentinel | `bool` | `false` | no |
| <a name="input_enable_service_principal_risk_events"></a> [enable\_service\_principal\_risk\_events](#input\_enable\_service\_principal\_risk\_events) | Enable Azure Active Directory Service Principal Risk Events in Sentinel | `bool` | `false` | no |
| <a name="input_enable_service_principal_sign_in_logs"></a> [enable\_service\_principal\_sign\_in\_logs](#input\_enable\_service\_principal\_sign\_in\_logs) | Enable Azure Active Directory Service Principal Sign In Logs in Sentinel | `bool` | `false` | no |
| <a name="input_enable_sign_in_logs"></a> [enable\_sign\_in\_logs](#input\_enable\_sign\_in\_logs) | Enable Azure Active Directory Sign In Logs in Sentinel | `bool` | `false` | no |
| <a name="input_enable_user_risk_events"></a> [enable\_user\_risk\_events](#input\_enable\_user\_risk\_events) | Enable Azure Active Directory User Risk Events in Sentinel | `bool` | `false` | no |
| <a name="input_log_analytics_storage_account_id"></a> [log\_analytics\_storage\_account\_id](#input\_log\_analytics\_storage\_account\_id) | The ID of the storage account in which Azure Sentinel logs are stored. | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | The ID of the Log Analytics workspace in which Azure Sentinel is deployed. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#output\_log\_analytics\_workspace\_id) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_storage_account_id"></a> [storage\_account\_id](#output\_storage\_account\_id) | n/a |
<!-- END_TF_DOCS -->