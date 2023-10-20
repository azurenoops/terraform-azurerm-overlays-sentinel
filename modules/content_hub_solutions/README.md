# Azure Sentinel Content Hub Solutions Module Overlay

[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![MIT License](https://img.shields.io/badge/license-MIT-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/azurenoops/overlays-sentinel/azurerm/)

This Overlay terraform module can create Azure Sentinel Content Hub Solutions and manage related parameters to be used in a [SCCA compliant Network](https://registry.terraform.io/modules/azurenoops/overlays-management-hub/azurerm/latest).

## Example Usage

```hcl  
module "mod_sentinel_content_hub_solutions" {
  source = "azurenoops/overlays-sentinel/azurerm//modules/content_hub_solutions"  
  version = "x.x.x"  
  
  log_analytics_workspace_name = azurerm_log_analytics_workspace.sentinel_workspace.name
  location                     = azurerm_log_analytics_workspace.sentinel_workspace.location
  resource_group_name          = azurerm_resource_group.sentinel_rg.name
  deploy_environment           = "dev"
  enable_solution_azure_ad     = true
}
```
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.36 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_mod_attacker_tools_tp_essentials"></a> [mod\_attacker\_tools\_tp\_essentials](#module\_mod\_attacker\_tools\_tp\_essentials) | azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group | ~> 1.0 |
| <a name="module_mod_azure_activity"></a> [mod\_azure\_activity](#module\_mod\_azure\_activity) | azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group | ~> 1.0 |
| <a name="module_mod_azure_ad"></a> [mod\_azure\_ad](#module\_mod\_azure\_ad) | azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group | ~> 1.0 |
| <a name="module_mod_cloud_identity_tp_essentials"></a> [mod\_cloud\_identity\_tp\_essentials](#module\_mod\_cloud\_identity\_tp\_essentials) | azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group | ~> 1.0 |
| <a name="module_mod_cloud_service_tp_essentials"></a> [mod\_cloud\_service\_tp\_essentials](#module\_mod\_cloud\_service\_tp\_essentials) | azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group | ~> 1.0 |
| <a name="module_mod_endpoint_tp_essentials"></a> [mod\_endpoint\_tp\_essentials](#module\_mod\_endpoint\_tp\_essentials) | azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group | ~> 1.0 |
| <a name="module_mod_kql_training"></a> [mod\_kql\_training](#module\_mod\_kql\_training) | azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group | ~> 1.0 |
| <a name="module_mod_microsoft_365"></a> [mod\_microsoft\_365](#module\_mod\_microsoft\_365) | azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group | ~> 1.0 |
| <a name="module_mod_microsoft_defender_for_cloud"></a> [mod\_microsoft\_defender\_for\_cloud](#module\_mod\_microsoft\_defender\_for\_cloud) | azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group | ~> 1.0 |
| <a name="module_mod_microsoft_defender_for_endpoint"></a> [mod\_microsoft\_defender\_for\_endpoint](#module\_mod\_microsoft\_defender\_for\_endpoint) | azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group | ~> 1.0 |
| <a name="module_mod_microsoft_defender_for_iot"></a> [mod\_microsoft\_defender\_for\_iot](#module\_mod\_microsoft\_defender\_for\_iot) | azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group | ~> 1.0 |
| <a name="module_mod_microsoft_dynamics_365"></a> [mod\_microsoft\_dynamics\_365](#module\_mod\_microsoft\_dynamics\_365) | azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group | ~> 1.0 |
| <a name="module_mod_network_session_essentials"></a> [mod\_network\_session\_essentials](#module\_mod\_network\_session\_essentials) | azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group | ~> 1.0 |
| <a name="module_mod_network_tp_essentials"></a> [mod\_network\_tp\_essentials](#module\_mod\_network\_tp\_essentials) | azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group | ~> 1.0 |
| <a name="module_mod_office_365_powerbi"></a> [mod\_office\_365\_powerbi](#module\_mod\_office\_365\_powerbi) | azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group | ~> 1.0 |
| <a name="module_mod_office_365_project"></a> [mod\_office\_365\_project](#module\_mod\_office\_365\_project) | azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group | ~> 1.0 |
| <a name="module_mod_office_insider_risk_management"></a> [mod\_office\_insider\_risk\_management](#module\_mod\_office\_insider\_risk\_management) | azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group | ~> 1.0 |
| <a name="module_mod_security_threat_essentials"></a> [mod\_security\_threat\_essentials](#module\_mod\_security\_threat\_essentials) | azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group | ~> 1.0 |
| <a name="module_mod_soar_essentials"></a> [mod\_soar\_essentials](#module\_mod\_soar\_essentials) | azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group | ~> 1.0 |
| <a name="module_mod_teams"></a> [mod\_teams](#module\_mod\_teams) | azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group | ~> 1.0 |
| <a name="module_mod_training_lab"></a> [mod\_training\_lab](#module\_mod\_training\_lab) | azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group | ~> 1.0 |
| <a name="module_mod_ueba_essentials"></a> [mod\_ueba\_essentials](#module\_mod\_ueba\_essentials) | azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group | ~> 1.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_deploy_environment"></a> [deploy\_environment](#input\_deploy\_environment) | Name of the workload's environnement (dev, test, prod, etc). This will be used to name the resources deployed by this module. default is 'dev' | `string` | n/a | yes |
| <a name="input_deployment_mode"></a> [deployment\_mode](#input\_deployment\_mode) | The Deployment Mode for this Resource Group Template Deployment. Possible values are Complete (where resources in the Resource Group not specified in the ARM Template will be destroyed) and Incremental (where resources are additive only). | `string` | `"Incremental"` | no |
| <a name="input_enable_solution_attacker_tools_threat_protection_essentials"></a> [enable\_solution\_attacker\_tools\_threat\_protection\_essentials](#input\_enable\_solution\_attacker\_tools\_threat\_protection\_essentials) | Enable Attacker Tools Threat Protection Essentials Solution in Sentinel. Default is false. | `bool` | `false` | no |
| <a name="input_enable_solution_azure_activity"></a> [enable\_solution\_azure\_activity](#input\_enable\_solution\_azure\_activity) | Enable Azure Activity Solution in Sentinel. Default is false. | `bool` | `false` | no |
| <a name="input_enable_solution_azure_ad"></a> [enable\_solution\_azure\_ad](#input\_enable\_solution\_azure\_ad) | Enable Azure Active Directory Solution in Sentinel. Default is false. | `bool` | `false` | no |
| <a name="input_enable_solution_cloud_identity_threat_protection_essentials"></a> [enable\_solution\_cloud\_identity\_threat\_protection\_essentials](#input\_enable\_solution\_cloud\_identity\_threat\_protection\_essentials) | Enable Cloud Identity Threat Protection Essentials Solution in Sentinel. Default is false. | `bool` | `false` | no |
| <a name="input_enable_solution_cloud_service_threat_protection_essentials"></a> [enable\_solution\_cloud\_service\_threat\_protection\_essentials](#input\_enable\_solution\_cloud\_service\_threat\_protection\_essentials) | Enable Cloud Service Threat Protection Essentials Solution in Sentinel. Default is false. | `bool` | `false` | no |
| <a name="input_enable_solution_endpoint_threat_protection_essentials"></a> [enable\_solution\_endpoint\_threat\_protection\_essentials](#input\_enable\_solution\_endpoint\_threat\_protection\_essentials) | Enable Endpoint Threat Protection Essentials Solution in Sentinel. Default is false. | `bool` | `false` | no |
| <a name="input_enable_solution_kql_training"></a> [enable\_solution\_kql\_training](#input\_enable\_solution\_kql\_training) | Enable KQL Training Solution in Sentinel. Default is false. | `bool` | `false` | no |
| <a name="input_enable_solution_microsoft_365"></a> [enable\_solution\_microsoft\_365](#input\_enable\_solution\_microsoft\_365) | Enable Microsoft 365 Solution in Sentinel. Default is false. | `bool` | `false` | no |
| <a name="input_enable_solution_microsoft_defender_for_cloud"></a> [enable\_solution\_microsoft\_defender\_for\_cloud](#input\_enable\_solution\_microsoft\_defender\_for\_cloud) | Enable Microsoft Defender for Cloud Solution in Sentinel. Default is false. | `bool` | `false` | no |
| <a name="input_enable_solution_microsoft_defender_for_endpoint"></a> [enable\_solution\_microsoft\_defender\_for\_endpoint](#input\_enable\_solution\_microsoft\_defender\_for\_endpoint) | Enable Microsoft Defender for Endpoint Solution in Sentinel. Default is false. | `bool` | `false` | no |
| <a name="input_enable_solution_microsoft_defender_for_iot"></a> [enable\_solution\_microsoft\_defender\_for\_iot](#input\_enable\_solution\_microsoft\_defender\_for\_iot) | Enable Microsoft Defender for IoT Solution in Sentinel. Default is false. | `bool` | `false` | no |
| <a name="input_enable_solution_microsoft_dynamics_365"></a> [enable\_solution\_microsoft\_dynamics\_365](#input\_enable\_solution\_microsoft\_dynamics\_365) | Enable Microsoft Dynamics 365 Solution in Sentinel. Default is false. | `bool` | `false` | no |
| <a name="input_enable_solution_microsoft_teams"></a> [enable\_solution\_microsoft\_teams](#input\_enable\_solution\_microsoft\_teams) | Enable Microsoft Teams Solution in Sentinel. Default is false. | `bool` | `false` | no |
| <a name="input_enable_solution_network_session_essentials"></a> [enable\_solution\_network\_session\_essentials](#input\_enable\_solution\_network\_session\_essentials) | Enable Network Session Essentials Solution in Sentinel. Default is false. | `bool` | `false` | no |
| <a name="input_enable_solution_network_threat_protection_essentials"></a> [enable\_solution\_network\_threat\_protection\_essentials](#input\_enable\_solution\_network\_threat\_protection\_essentials) | Enable Network Threat Protection Essentials Solution in Sentinel. Default is false. | `bool` | `false` | no |
| <a name="input_enable_solution_office_365_powerbi"></a> [enable\_solution\_office\_365\_powerbi](#input\_enable\_solution\_office\_365\_powerbi) | Enable Office 365 PowerBI Solution in Sentinel. Default is false. | `bool` | `false` | no |
| <a name="input_enable_solution_office_365_project"></a> [enable\_solution\_office\_365\_project](#input\_enable\_solution\_office\_365\_project) | Enable Office 365 Project Solution in Sentinel. Default is false. | `bool` | `false` | no |
| <a name="input_enable_solution_office_insider_risk_management"></a> [enable\_solution\_office\_insider\_risk\_management](#input\_enable\_solution\_office\_insider\_risk\_management) | Enable Office Insider Risk Management Solution in Sentinel. Default is false. | `bool` | `false` | no |
| <a name="input_enable_solution_security_threat_essentials"></a> [enable\_solution\_security\_threat\_essentials](#input\_enable\_solution\_security\_threat\_essentials) | Enable Security Threat Essentials Solution in Sentinel. Default is false. | `bool` | `false` | no |
| <a name="input_enable_solution_soar_essentials"></a> [enable\_solution\_soar\_essentials](#input\_enable\_solution\_soar\_essentials) | Enable SOAR Essentials Solution in Sentinel. Default is false. | `bool` | `false` | no |
| <a name="input_enable_solution_threat_intelligence"></a> [enable\_solution\_threat\_intelligence](#input\_enable\_solution\_threat\_intelligence) | Enable Threat Intelligence Solution in Sentinel. Default is false. | `bool` | `false` | no |
| <a name="input_enable_solution_training_lab"></a> [enable\_solution\_training\_lab](#input\_enable\_solution\_training\_lab) | Enable Training Lab Solution in Sentinel. Default is false. | `bool` | `false` | no |
| <a name="input_enable_solution_ueba_essentials"></a> [enable\_solution\_ueba\_essentials](#input\_enable\_solution\_ueba\_essentials) | Enable UEBA Essentials Solution in Sentinel. Default is false. | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure Region in which Azure Sentinel is deployed. | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_name"></a> [log\_analytics\_workspace\_name](#input\_log\_analytics\_workspace\_name) | The name of the Log Analytics workspace in which Azure Sentinel is deployed. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the Resource Group in which Azure Sentinel is deployed. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->