# Azure Sentinel Overlay Terraform Module

[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![MIT License](https://img.shields.io/badge/license-MIT-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/azurenoops/overlays-sentinel/azurerm/)

This Overlay terraform module contains modules for deploying and managing Azure Sentinel components supporting features which are used to detect cyber threats to be used in a [SCCA compliant Network](https://registry.terraform.io/modules/azurenoops/overlays-management-hub/azurerm/latest).

For more information, please read the [SCCA documentation](https://docs.microsoft.com/en-us/azure/azure-government/documentation-government-get-started-connect-with-cli).

## Contributing

If you want to contribute to this repository, please feel free to to contribute to our Terraform module.

More details are available in the [CONTRIBUTING.md](./CONTRIBUTING.md#pull-request-process) file.

<!-- ## Rule Alerts

### Example Usage

```hcl  
module "mod_sentinel_rules" {  
  source = "azurenoops/overlays-sentinel-rules/azurerm//modules/scheduled_alert_rule"  
  version = "x.x.x"  
  
    name = "scheduled-alert-rule"
    description = "Scheduled alert rule"
    severity = "High"
    query = "SecurityEvent | where EventID == \"4688\" | where AccountType == \"User\" | where Account =~ \"NT AUTHORITY\\SYSTEM\" | where NewProcessName =~ \"C:\\\\Windows\\\\System32\\\\svchost.exe\" | where CommandLine =~ \"-k netsvcs\" | where NewProcessId == \"4\" | where ParentProcessName =~ \"C:\\\\Windows\\\\System32\\\\services.exe\" | where ParentProcessId == \"552\" | where SubjectLogonId == \"0x3e4\" | where SubjectUserName =~ \"NT AUTHORITY\\\\SYSTEM\" | where S"
    enabled = true 
}
``` -->

## Data Connectors

This module can also create data connectors for Sentinel. The following data connectors are available:

- Azure Active Directory
- Azure Advanced Threat Protection
- Azure Information Protection
- Azure Security Center
- Microsoft Cloud App Security
- Microsoft Defender Advanced Threat Protection
- Microsoft Dynamics 365
- Microsoft Office 365
- Microsoft Power BI
- Microsoft Teams
- Microsoft Threat Intelligence

### Example Usage

```hcl  
module "mod_sentinel_connectors_azure_active_directory" {  
  source = "azurenoops/overlays-sentinel-rules/azurerm//modules/data_connetors/azure_active_directory"  
  version = "x.x.x"  
  
    log_analytics_workspace_id = /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-sentinel/providers/microsoft.operationalinsights/workspaces/la-sentinel
}
```
