# Azure Sentinel Overlay Terraform Module

[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![MIT License](https://img.shields.io/badge/license-MIT-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/azurenoops/overlays-sentinel/azurerm/)

This Overlay terraform module contains modules for deploying and managing Azure Sentinel components supporting features which are used to detect cyber threats to be used in a [SCCA compliant Network](https://registry.terraform.io/modules/azurenoops/overlays-management-hub/azurerm/latest).

## SCCA Compliance

For more information, please read the [SCCA documentation](https://docs.microsoft.com/en-us/azure/azure-government/documentation-government-get-started-connect-with-cli).

## Contributing

If you want to contribute to this repository, please feel free to to contribute to our Terraform module.

More details are available in the [CONTRIBUTING.md](./CONTRIBUTING.md#pull-request-process) file.

## Rule Alerts

### Microsoft Security Incident Alert Rule Example Usage

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

### Microsoft Fusion Alert Rule Example Usage

```hcl  
module "mod_sentinel_fusion_alert_rule" {  
  source = "azurenoops/overlays-sentinel/azurerm//modules/fusion_alert_rule"  
  version = "~> x.x.x"  
  
  log_analytics_workspace_id = azurerm_log_analytics_workspace.sentinel_workspace.id
  name                       = var.name
  alert_rule_template_guid   = "f71aba3d-28fb-450b-b192-4e76a83015c8"
  enable_rule_alert          = true
}
```

## Data Connectors

This module can also create data connectors for Sentinel. The following data connectors are available:

The following table summarizes permissions, licenses and permissions needed and related cost to enable each Data Connector:

| Data Connector                                 | License         |  Permissions                    | Cost      |
| ---------------------------------------------- | --------------- |---------------------------------|-----------|
| Azure Active Directory Identity Protection  | AAD Premium 2   | Global Admin or Security Admin  | Free      |
| Azure Activity                                 | None            | Subscription Reader             | Free      |
| Microsoft 365 Defender                         | M365D license   | Global Admin or Security Admin  | Free      |
| Microsoft Defender for Cloud                   | MDC license     | Security Reader                 | Free      |
| Microsoft Insider Risk Management              | IRM license     | Global Admin or Security Admin  | Free      |
| Office 365                                     | None            | Global Admin or Security Admin  | Free      |
| Azure Active Directory (Tenant scope version only) | Any AAD license | Global Admin or Security Admin  | Billed    |
| Dynamics 365                                   | D365 license    | Global Admin or Security Admin  | Billed    |
| Microsoft PowerBi                              | PowerBi license | Global Admin or Security Admin  | Billed    |
| Microsoft Project                              | MS Project license | Global Admin or Security Admin | Billed  |
| Threat Intelligence Platforms                  | None            | Global Admin or Security Admin  | Billed    |

### Microsoft Azure Active Directory Data Connector Example Usage

```hcl  
module "mod_sentinel_connectors_azure_active_directory" {  
  source = "azurenoops/overlays-sentinel-rules/azurerm//modules/data_connetors/azure_active_directory"  
  version = "x.x.x"  
  
    log_analytics_workspace_id = /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-sentinel/providers/microsoft.operationalinsights/workspaces/la-sentinel
}
```

## Azure Active Directory Dianostics Settings

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
