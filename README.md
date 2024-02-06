# Azure Sentinel Overlay Terraform Module

[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![MIT License](https://img.shields.io/badge/license-MIT-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/azurenoops/overlays-sentinel/azurerm/)

This Overlay terraform module contains modules for deploying and managing Azure Sentinel components supporting features which are used to detect cyber threats to be used in a [SCCA compliant Network](https://registry.terraform.io/modules/azurenoops/overlays-management-hub/azurerm/latest).

## SCCA Compliance

For more information, please read the [SCCA documentation](https://docs.microsoft.com/en-us/azure/azure-government/documentation-government-get-started-connect-with-cli).

## Contributing

If you want to contribute to this repository, please feel free to to contribute to our Terraform module.

More details are available in the [CONTRIBUTING.md](./CONTRIBUTING.md#pull-request-process) file.

## JFHQ-DODIN TASKORD 24-006 Support

This module supports the JFHQ-DODIN TASKORD 24-006 by providing the ability to deploy and manage Azure Sentinel components.

### Required Installed Components

- Azure Monitor MS Entra Id Diagnostic Settings
- Azure UBEA Solutions
- Azure Content Hub Solutions (MS XDR)
- Azure Data Connectors (MS Entra Id, MS XDR)

## Rule Alerts

### Microsoft Security Incident Alert Rule Example Usage

The following example will create a Microsoft Security Incident Alert Rule which uses an alert rule template to trigger an incident if the query returns any results.

```hcl  
module "mod_sentinel" {  
  source = "azurenoops/overlays-sentinel/azurerm"  
  version = "~> x.x.x"  
  
  # Log Analytics Workspace
  log_analytics_workspace_id = azurerm_log_analytics_workspace.sentinel_workspace.id
  deploy_environment         = "dev"

  # MS Security Incident Alert Rules
  ms_security_incident_alert_rules = {
    "ms_security_incident_alert_rule_1" = {
      product_filter           = "Azure Security Center"
      display_name             = "Security Incident"
      severity_filter          = "High"
      alert_rule_template_guid = "f71aba3d-28fb-450b-b192-4e76a83015c8"
      description              = "Security Incident"
      enabled                  = true
    }
  }
}
```

### Microsoft Fusion Alert Rule Example Usage

The following example will create a Fusion Alert Rule which uses an alert rule template to trigger an incident if the query returns any results.

```hcl

```hcl  
module "mod_sentinel" {  
  source = "azurenoops/overlays-sentinel/azurerm"  
  version = "~> x.x.x"  
  
  # Log Analytics Workspace
  log_analytics_workspace_id = azurerm_log_analytics_workspace.sentinel_workspace.id
  deploy_environment         = "dev"

  # Fusion Alert Rules
  fusion_alert_rules = {
    "fusion_alert_rule_1" = {
      alert_rule_template_guid = "f71aba3d-28fb-450b-b192-4e76a83015c8"
      enabled        = true
    }
  } 
}
```

### Microsoft Scheduled Alert Rule Example Usage

The following example will create a scheduled alert rule which will run every 5 minutes and will trigger an incident if the query returns any results. The incident will be created for the `SecurityEvent` table and will be grouped by the `Account` column. The incident will be created if the query returns any results and will be closed after 1 hour.

```hcl

module "mod_sentinel" {
  source = "azurenoops/overlays-sentinel/azurerm"
  version = "~> x.x.x"

  # Log Analytics Workspace
  log_analytics_workspace_id = azurerm_log_analytics_workspace.sentinel_workspace.id
  deploy_environment         = "dev"

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
# Enable SOAR Essentials for Send Email and Create Incident
module "mod_sentinel" {
  source = "azurenoops/overlays-sentinel/azurerm"  
  version = "x.x.x"  
  
  # Required Inputs
  log_analytics_workspace_id = azurerm_log_analytics_workspace.sentinel_workspace.id
  deploy_environment         = "dev"

  # Only Required for Conent Hub Solutions
  log_analytics_workspace_name     = azurerm_log_analytics_workspace.sentinel_workspace.name
  log_analytics_workspace_location = azurerm_resource_group.sentinel_rg.location
  resource_group_name              = azurerm_resource_group.sentinel_rg.name

  # Content Hub Solutions
  enable_solution_soar_essentials = true

  # Automation Rules
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

- Azure Active Directory (AzureActiveDirectory)
- Azure Advanced Threat Protection (AzureAdvancedThreatProtection)
- Azure Security Center (AzureSecurityCenter)
- Dynamics 365 (Dynamics365)
- IoT Hub (IoT)
- Microsoft Defender Advanced Threat Protection (MicrosoftDefenderAdvancedThreatProtection)
- Microsoft Cloud App Security (MicrosoftCloudAppSecurity)
- Office Insider Risk Management (OfficeIRM)
- Office PowerBi (OfficePowerBI)
- Microsoft Project (Office365Project)
- Office Advanced Threat Protection (OfficeATP)
- Office 365 (Office365)
- Microsoft Threat Protection (MicrosoftThreatProtection)
- Threat Intelligence Platforms (MicrosoftThreatIntelligence)

To view the full list of permissions needed and related cost to enable each Data Connector, please visit the [Azure Sentinel Data Connectors](https://learn.microsoft.com/en-us/azure/sentinel/billing?tabs=simplified%2Ccommitment-tiers#free-data-sources) documentation.

> **Note:** It is important to note that each data connector need to be the correct spelling and case sensitive. For example, `AzureActiveDirectory` is the correct spelling and case sensitive.

### Microsoft Azure Active Directory Data Connector Example Usage

```hcl  
module "mod_sentinel" {  
  source = "azurenoops/overlays-sentinel-rules/azurerm"  
  version = "x.x.x"  

  log_analytics_workspace_id = azurerm_log_analytics_workspace.sentinel_workspace.id
  deploy_environment         = "dev"

  data_connectors = ["AzureActiveDirectory", "AzureAdvancedThreatProtection"]
}
```

## Azure Active Directory Diagnostics Settings

Manages an Azure Active Directory Diagnostic Setting for Azure Monitor.

Defualt Logs included in the Diagnostic Settings are:

- AuditLogs
- SignInLogs
- NonInteractiveUserSignInLogs
- ServicePrincipalSignInLogs
- ManagedIdentitySignInLogs
- ProvisioningLogs
- ADFSSignInLogs
- RiskyUsers
- UserRiskEvents
- NetworkAccessTrafficLogs
- RiskyServicePrincipals
- ServicePrincipalRiskEvents
- EnrichedOffice365AuditLogs
- MicrosoftGraphActivityLogs

## Example Usage

```hcl  
module "mod_sentinel" {
  #source = "azurenoops/overlays-sentinel/azurerm"  
  #version = "x.x.x"  
  
  log_analytics_workspace_id = azurerm_log_analytics_workspace.sentinel_workspace.id
  deploy_environment         = "dev"

  data_connector_aad_enabled = true
  data_connector_aad_logs    = ["AuditLogs", "SignInLogs", "NonInteractiveUserSignInLogs", "ServicePrincipalSignInLogs", "ManagedIdentitySignInLogs","ProvisioningLogs", "ADFSSignInLogs", "RiskyUsers", "UserRiskEvents", "NetworkAccessTrafficLogs", "RiskyServicePrincipals", "ServicePrincipalRiskEvents", "EnrichedOffice365AuditLogs", "MicrosoftGraphActivityLogs"]
  retention_policy_days      = 30

}
```

## Content Hub Solutions

The Content Hub Solutions can be enabled by using the `enable_solution_` prefix.

The following Content Hub Solutions are available:

First Party Solutions:

- Azure Active Directory
- Azure Activity
- Microsoft 365
- Microsoft Teams
- Microsoft Defender For Cloud
- Microsoft Defender For Endpoint
- Microsoft Defender For IOT
- Microsoft Dynamics
- Office Insider Risk Management
- Office 365 Project
- Office 365 Power BI
- Threat Intelligence
- SOC Handbook
- SOC Process Automation

Solutions Essentials: 

- Sentinel SOAR Essentials
- Sentinel UEBA Essentials
- Sentinel Attacker Tools Threat Protection Essentials
- Sentinel Cloud Identity Threat Protection Essential
- Sentinel Cloud Service Threat Protection Essentials
- Sentinel Endpoint Threat Protection Essentials
- Sentinel Network Session Essentials
- Sentinel Network Threat Protection Essentials
- Sentinel Security Threat Protection Essentials

Training Solutions:

- Sentinel KQL Training
- Sentinel Training Lab

## Azure Active Directory Content Hub Solution Example Usage

```hcl  
module "mod_sentinel" {
  source = "azurenoops/overlays-sentinel/azurerm//modules/content_hub_solutions"  
  version = "x.x.x"  
  
  # Required Inputs
  log_analytics_workspace_id = azurerm_log_analytics_workspace.sentinel_workspace.id
  deploy_environment         = "dev"

  # Only Required for Conent Hub Solutions
  log_analytics_workspace_name     = azurerm_log_analytics_workspace.sentinel_workspace.name
  log_analytics_workspace_location = azurerm_resource_group.sentinel_rg.location
  resource_group_name              = azurerm_resource_group.sentinel_rg.name

  # Content Hub Solutions
  enable_solution_azure_activity = true
}
```

## UBEA Solutions

The UBEA Solutions can be enabled by using the `enable_ueba` variable.

> **Note:** The UBEA Solutions require the `ueba_data_sources` and `ueba_entity_providers` variables to be set. The `ueba_data_sources` variable is a list of data sources to be used and the `ueba_entity_providers` variable is a list of entity providers to be used.

```hcl
module "mod_sentinel" {
  source = "azurenoops/overlays-sentinel/azurerm//modules/ubea"  
  version = "x.x.x"  
  
 # Log Analytics Workspace
  log_analytics_workspace_id = azurerm_log_analytics_workspace.sentinel_workspace.id
  deploy_environment         = "dev"

  # UBEA
  enable_ueba           = true
  ueba_data_sources     = ["AuditLogs", "AzureActivity", "SecurityEvent", "SigninLogs"]
  ueba_entity_providers = ["AzureActiveDirectory"]
}
```
