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

The following example will create a Security Incident Alert Rule which uses an alert rule template to trigger an incident if the query returns any results.

```hcl

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

The following example will create a Fusion Alert Rule which uses an alert rule template to trigger an incident if the query returns any results.

```hcl

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

### Microsoft Scheduled Alert Rule Example Usage

The following example will create a scheduled alert rule which will run every 5 minutes and will trigger an incident if the query returns any results. The incident will be created for the `SecurityEvent` table and will be grouped by the `Account` column. The incident will be created if the query returns any results and will be closed after 1 hour.

```hcl

module "mod_sentinel_scheduled_alert_rule" {
  source = "azurenoops/overlays-sentinel/azurerm//modules/scheduled_alert_rule"
  version = "~> x.x.x"

   scheduled_alert_rules = {
    "scheduled_alert_rule1" = {
      display_name               = "Scheduled Alert Rule"
      log_analytics_workspace_id = "${azurerm_log_analytics_workspace.sentinel_workspace.id}"
      name                       = "Scheduled Alert Rule"
      query                      = "SecurityEvent | where EventID == 4625"
      severity                   = "High"
      suppression_duration       = "PT1H"
      suppression_enabled        = true
      tactics                    = ["Persistence"]
      techniques                 = ["Valid Accounts"]
      entity_mapping = [
        {
          entity_type = "Account"
          field_mapping = [
            {
              column_name = "Account"
              identifier  = "Account"
            }
          ]
        }
      ]
      event_grouping = [
        {
          aggregation_method = "Count"
        }
      ]
      incident_configuration = [
        {
          create_incident = true
          grouping = [
            {
              enabled                 = true
              lookback_duration       = "PT1H"
              reopen_closed_incidents = true
              entity_matching_method  = "ByEntities"
              group_by_entities       = ["Account"]
              group_by_alert_details  = ["Account"]
              group_by_custom_details = ["Account"]
            }
          ]
        }
      ]
    }
  }
}
```

### Microsoft Automation Rule Example Usage

The following example will create an automation rule which will trigger an incident if the query returns any results. The incident will be created for the `SecurityEvent` table and will be grouped by the `Account` column. The incident will be created if the query returns any results and will be closed after 1 hour.

```hcl
module "mod_sentinel_automation_rule" {
  source = "azurenoops/overlays-sentinel/azurerm//modules/automation_rule"
  version = "~> x.x.x"

  automation_rules = {
    "automation_rule1" = {
      display_name               = "Automation Rule"
      log_analytics_workspace_id = "${azurerm_log_analytics_workspace.sentinel_workspace.id}"
      name                       = uuid()
      order                      = 1
      condition_json             = <<CONDITION
                                    {                                     
                                      "conditions": [
                                        {
                                          "field": "AlertName",
                                          "equals": "Suspicious activity from a Tor exit node"
                                        }
                                      ]
                                    }
                                    CONDITION
      enabled                    = true      
      triggers_on                = "Incidents"
      triggers_when              = "Created"      
      action_incident = [
        {
          order                  = 1
          status                 = "New"
          classification         = "BenignPositive_SuspiciousButExpected"
          classification_comment = "Unclassified"
          labels                 = ["Tor"]
          owner_id               = "00000000-0000-0000-0000-000000000000"
          severity               = "Medium"
        }
      ]    
    }
  }
}
```

## Data Connectors

This module can also create data connectors for Sentinel. The following data connectors are available:

- Azure Active Directory (Tenant scope version only)
- Azure Active Directory Identity Protection  
- Azure Activity
- Dynamics 365
- Microsoft 365 Defender
- Microsoft Defender for Cloud
- Microsoft Insider Risk Management
- Microsoft PowerBi
- Microsoft Project
- Office 365
- Threat Intelligence Platforms

To view the full list of permissions needed and related cost to enable each Data Connector, please visit the [Azure Sentinel Data Connectors](https://learn.microsoft.com/en-us/azure/sentinel/billing?tabs=simplified%2Ccommitment-tiers#free-data-sources) documentation.

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

## Content Hub Solutions

## Azure Active Directory Content Hub Solution Example Usage

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

## UBEA Solutions

```hcl
module "mod_sentinel_ubea" {
  source = "azurenoops/overlays-sentinel/azurerm//modules/ubea"  
  version = "x.x.x"  
  
  ueba_data_sources                           = var.ueba_data_sources
  ueba_entity_providers                       = var.ueba_entity_providers
  log_analytics_workspace_name                = azurerm_log_analytics_workspace.sentinel_workspace.name
  log_analytics_workspace_resource_group_name = azurerm_resource_group.sentinel_rg.name
}
```
