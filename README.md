# Azure Sentinel Rules Overlay

[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![MIT License](https://img.shields.io/badge/license-MIT-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/azurenoops/overlays-sentinel-rules/azurerm/)

This Overlay terraform module can create Sentinel Rules and manage related parameters to be used in a [SCCA compliant Network](https://registry.terraform.io/modules/azurenoops/overlays-hubspoke/azurerm/latest).

## SCCA Compliance

This module can be SCCA compliant and can be used in a SCCA compliant Network. Enable private endpoints and SCCA compliant network rules to make it SCCA compliant.

For more information, please read the [SCCA documentation]().

## Usage

```hcl  
module "sentinel_rules" {  
  source = "azurenoops/overlays-sentinel-rules/azurerm//modules/scheduled-alert-rule"  
  version = "0.1.0"  
  
    name = "scheduled-alert-rule"
    description = "Scheduled alert rule"
    severity = "High"
    query = "SecurityEvent | where EventID == \"4688\" | where AccountType == \"User\" | where Account =~ \"NT AUTHORITY\\SYSTEM\" | where NewProcessName =~ \"C:\\\\Windows\\\\System32\\\\svchost.exe\" | where CommandLine =~ \"-k netsvcs\" | where NewProcessId == \"4\" | where ParentProcessName =~ \"C:\\\\Windows\\\\System32\\\\services.exe\" | where ParentProcessId == \"552\" | where SubjectLogonId == \"0x3e4\" | where SubjectUserName =~ \"NT AUTHORITY\\\\SYSTEM\" | where S"
    enabled = true 
}
```
