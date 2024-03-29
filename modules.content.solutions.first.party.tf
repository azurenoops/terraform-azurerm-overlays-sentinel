# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# Enable Microsoft XDR Solution in Sentinel 
module "mod_microsoft_xdr_id" {
  depends_on = [ azurerm_sentinel_log_analytics_workspace_onboarding.sentinel ]
  source  = "azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group"
  version = "~> 1.0"
  count   = var.enable_solution_microsoft_xdr ? 1 : 0

  name                = "deploy_microsoft_xdr_content_solution"
  resource_group_name = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.resource_group_name
  deployment_mode     = var.deployment_mode
  deploy_environment  = var.deploy_environment
  workload_name       = "solutions"

  arm_script = file("${path.module}/sentinel/microsoft_xdr.json")

  parameters_override = {
    "workspace"          = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_name,
    "workspace-location" = var.log_analytics_workspace_location
  }
}

# Enable Microsoft Entra ID Solution in Sentinel 
module "mod_microsoft_entra_id" {
  depends_on = [ azurerm_sentinel_log_analytics_workspace_onboarding.sentinel ]
  source  = "azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group"
  version = "~> 1.0"
  count   = var.enable_solution_azure_ad ? 1 : 0

  name                = "deploy_microsoft_entra_id_content_solution"
  resource_group_name = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.resource_group_name
  deployment_mode     = var.deployment_mode
  deploy_environment  = var.deploy_environment
  workload_name       = "solutions"

  arm_script = file("${path.module}/sentinel/azuread.json")

  parameters_override = {
    "workspaceName" = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_name,
    "location"      = var.log_analytics_workspace_location
  }
}

# Enable Azure Active Directory Solution in Sentinel 
module "mod_azure_activity" {
  depends_on = [ azurerm_sentinel_log_analytics_workspace_onboarding.sentinel ]
  source  = "azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group"
  version = "~> 1.0"
  count   = var.enable_solution_azure_activity ? 1 : 0

  name                = "deploy_azure_activity_content_solution"
  resource_group_name = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.resource_group_name
  deployment_mode     = var.deployment_mode
  deploy_environment  = var.deploy_environment
  workload_name       = "solutions"

  arm_script = file("${path.module}/sentinel/azure_activity.json")

  parameters_override = {
    "workspaceName" = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_name,
    "location"      = var.log_analytics_workspace_location
  }
}

# Enable Microsoft 365 Solution in Sentinel 
module "mod_microsoft_365" {
  depends_on = [ azurerm_sentinel_log_analytics_workspace_onboarding.sentinel ]
  source  = "azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group"
  version = "~> 1.0"
  count   = var.enable_solution_microsoft_365 ? 1 : 0

  name                = "deploy_microsoft_365_content_solution"
  resource_group_name = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.resource_group_name
  deployment_mode     = var.deployment_mode
  deploy_environment  = var.deploy_environment
  workload_name       = "solutions"

  arm_script = file("${path.module}/sentinel/microsoft_365.json")

  parameters_override = {
    "workspaceName" = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_name,
    "location"      = var.log_analytics_workspace_location
  }
}

# Enable Microsoft Teams Solution in Sentinel 
module "mod_teams" {
  depends_on = [ azurerm_sentinel_log_analytics_workspace_onboarding.sentinel ]
  source  = "azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group"
  version = "~> 1.0"
  count   = var.enable_solution_microsoft_teams ? 1 : 0

  name                = "deploy_microsoft_teams_content_solution"
  resource_group_name = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.resource_group_name
  deployment_mode     = var.deployment_mode
  deploy_environment  = var.deploy_environment
  workload_name       = "solutions"

  arm_script = file("${path.module}/sentinel/microsoft_teams.json")

  parameters_override = {
    "workspaceName" = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_name,
    "location"      = var.log_analytics_workspace_location
  }
}

# Enable Microsoft Defender For Cloud Solution in Sentinel 
module "mod_microsoft_defender_for_cloud" {
  depends_on = [ azurerm_sentinel_log_analytics_workspace_onboarding.sentinel ]
  source  = "azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group"
  version = "~> 1.0"
  count   = var.enable_solution_microsoft_defender_for_cloud ? 1 : 0

  name                = "deploy_microsoft_defender_for_cloud_solution"
  resource_group_name = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.resource_group_name
  deployment_mode     = var.deployment_mode
  deploy_environment  = var.deploy_environment
  workload_name       = "solutions"

  arm_script = file("${path.module}/sentinel/microsoft_defender_for_cloud.json")

  parameters_override = {
    "workspaceName" = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_name,
    "location"      = var.log_analytics_workspace_location
  }
}

# Enable Microsoft Defender For Endpoint Solution in Sentinel 
module "mod_microsoft_defender_for_endpoint" {
  depends_on = [ azurerm_sentinel_log_analytics_workspace_onboarding.sentinel ]
  source  = "azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group"
  version = "~> 1.0"
  count   = var.enable_solution_microsoft_defender_for_endpoint ? 1 : 0

  name                = "deploy_microsoft_defender_for_endpoint_solution"
  resource_group_name = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.resource_group_name
  deployment_mode     = var.deployment_mode
  deploy_environment  = var.deploy_environment
  workload_name       = "solutions"

  arm_script = file("${path.module}/sentinel/microsoft_defender_for_endpoint.json")

  parameters_override = {
    "workspaceName" = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_name,
    "location"      = var.log_analytics_workspace_location
  }
}

# Enable Microsoft Defender For IOT Solution in Sentinel 
module "mod_microsoft_defender_for_iot" {
  depends_on = [ azurerm_sentinel_log_analytics_workspace_onboarding.sentinel ]
  source  = "azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group"
  version = "~> 1.0"
  count   = var.enable_solution_microsoft_defender_for_iot ? 1 : 0

  name                = "deploy_microsoft_defender_for_iot_solution"
  resource_group_name = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.resource_group_name
  deployment_mode     = var.deployment_mode
  deploy_environment  = var.deploy_environment
  workload_name       = "solutions"

  arm_script = file("${path.module}/sentinel/microsoft_defender_for_iot.json")

  parameters_override = {
    "workspaceName" = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_name,
    "location"      = var.log_analytics_workspace_location
  }
}

# Enable Microsoft Dynamics Solution in Sentinel 
module "mod_microsoft_dynamics_365" {
  depends_on = [ azurerm_sentinel_log_analytics_workspace_onboarding.sentinel ]
  source  = "azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group"
  version = "~> 1.0"
  count   = var.enable_solution_microsoft_dynamics_365 ? 1 : 0

  name                = "deploy_microsoft_dynamics_365_solution"
  resource_group_name = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.resource_group_name
  deployment_mode     = var.deployment_mode
  deploy_environment  = var.deploy_environment
  workload_name       = "solutions"

  arm_script = file("${path.module}/sentinel/microsoft_dynamics_365.json")

  parameters_override = {
    "workspaceName" = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_name,
    "location"      = var.log_analytics_workspace_location
  }
}

# Enable Office Insider Risk Management Solution in Sentinel 
module "mod_office_insider_risk_management" {
  depends_on = [ azurerm_sentinel_log_analytics_workspace_onboarding.sentinel ]
  source  = "azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group"
  version = "~> 1.0"
  count   = var.enable_solution_office_insider_risk_management ? 1 : 0

  name                = "deploy_office_insider_risk_management_solution"
  resource_group_name = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.resource_group_name
  deployment_mode     = var.deployment_mode
  deploy_environment  = var.deploy_environment
  workload_name       = "solutions"

  arm_script = file("${path.module}/sentinel/office_insider_risk_management.json")

  parameters_override = {
    "workspaceName" = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_name,
    "location"      = var.log_analytics_workspace_location
  }
}

# Enable Office 365 Project Solution in Sentinel 
module "mod_office_365_project" {
  depends_on = [ azurerm_sentinel_log_analytics_workspace_onboarding.sentinel ]
  source  = "azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group"
  version = "~> 1.0"
  count   = var.enable_solution_office_365_project ? 1 : 0

  name                = "deploy_office_365_project_solution"
  resource_group_name = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.resource_group_name
  deployment_mode     = var.deployment_mode
  deploy_environment  = var.deploy_environment
  workload_name       = "solutions"

  arm_script = file("${path.module}/sentinel/office_365_project.json")

  parameters_override = {
    "workspaceName" = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_name,
    "location"      = var.log_analytics_workspace_location
  }
}

# Enable Office 365 Power BI Solution in Sentinel 
module "mod_office_365_powerbi" {
  depends_on = [ azurerm_sentinel_log_analytics_workspace_onboarding.sentinel ]
  source  = "azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group"
  version = "~> 1.0"
  count   = var.enable_solution_office_365_powerbi ? 1 : 0

  name                = "deploy_office_365_powerbi_solution"
  resource_group_name = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.resource_group_name
  deployment_mode     = var.deployment_mode
  deploy_environment  = var.deploy_environment
  workload_name       = "solutions"

  arm_script = file("${path.module}/sentinel/office_365_powerbi.json")

  parameters_override = {
    "workspaceName" = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_name,
    "location"      = var.log_analytics_workspace_location
  }
}

# Enable Threat Intelligence Solution in Sentinel
module "mod_threat_intelligence" {
  depends_on = [ azurerm_sentinel_log_analytics_workspace_onboarding.sentinel ]
  source  = "azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group"
  version = "~> 1.0"
  count   = var.enable_solution_threat_intelligence ? 1 : 0

  name                = "deploy_threat_intelligence_solution"
  resource_group_name = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.resource_group_name
  deployment_mode     = var.deployment_mode
  deploy_environment  = var.deploy_environment
  workload_name       = "solutions"

  arm_script = file("${path.module}/sentinel/threat_intelligence.json")

  parameters_override = {
    "workspaceName" = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_name,
    "location"      = var.log_analytics_workspace_location
  }
}

# Enable SOC Handbook Solution in Sentinel
module "mod_soc_handbook" {
  depends_on = [ azurerm_sentinel_log_analytics_workspace_onboarding.sentinel ]
  source  = "azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group"
  version = "~> 1.0"
  count   = var.enable_solution_soc_handbook ? 1 : 0

  name                = "deploy_soc_handbook_solution"
  resource_group_name = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.resource_group_name
  deployment_mode     = var.deployment_mode
  deploy_environment  = var.deploy_environment
  workload_name       = "solutions"

  arm_script = file("${path.module}/sentinel/SOCHandbook.json")

  parameters_override = {
    "workspaceName" = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_name,
    "location"      = var.log_analytics_workspace_location
  }
}

# Enable SOC Handbook Solution in Sentinel
module "mod_soc_process_fx" {
  depends_on = [ azurerm_sentinel_log_analytics_workspace_onboarding.sentinel ]
  source  = "azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group"
  version = "~> 1.0"
  count   = var.enable_solution_soc_process_fx ? 1 : 0

  name                = "deploy_soc_process_fx_solution"
  resource_group_name = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.resource_group_name
  deployment_mode     = var.deployment_mode
  deploy_environment  = var.deploy_environment
  workload_name       = "solutions"

  arm_script = file("${path.module}/sentinel/SOCProcessFramework.json")

  parameters_override = {
    "workspaceName" = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_name,
    "location"      = var.log_analytics_workspace_location
  }
}
