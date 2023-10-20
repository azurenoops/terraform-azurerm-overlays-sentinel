# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# Enable Sentinel SOAR Essentials Solution 
module "mod_deploy_soar_essentials" {
  source  = "azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group"
  version = "~> 1.0"
  count   = var.enable_solution_soar_essentials ? 1 : 0

  name                = "deploy_soar_essentials_content_solution"
  resource_group_name = var.resource_group_name
  deployment_mode     = var.deployment_mode
  deploy_environment  = var.deploy_environment
  workload_name       = "solutions"

  arm_script = file("${path.module}/sentinel/soar_essentials.json")

  parameters_override = {
    "workspaceName" = var.log_analytics_workspace_name,
    "location"      = var.location
  }
}

# Enable Sentinel UEBA Essentials Solution
module "mod_deploy_ueba_essentials" {
  source  = "azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group"
  version = "~> 1.0"
  count   = var.enable_solution_ueba_essentials ? 1 : 0

  name                = "deploy_ueba_essentials_content_solution"
  resource_group_name = var.resource_group_name
  deployment_mode     = var.deployment_mode
  deploy_environment  = var.deploy_environment
  workload_name       = "solutions"

  arm_script = file("${path.module}/sentinel/ueba_essentials.json")

  parameters_override = {
    "workspaceName" = var.log_analytics_workspace_name,
    "location"      = var.location
  }
}

# Enable Sentinel Attacker Tools Threat Protection Essentials Solution
module "mod_deploy_attacker_tools_threat_protection_essentials" {
  source  = "azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group"
  version = "~> 1.0"
  count   = var.enable_solution_attacker_tools_threat_protection_essentials ? 1 : 0

  name                = "deploy_attacker_tools_threat_protection_essentials_content_solution"
  resource_group_name = var.resource_group_name
  deployment_mode     = var.deployment_mode
  deploy_environment  = var.deploy_environment
  workload_name       = "solutions"

  arm_script = file("${path.module}/sentinel/attacker_tools_threat_protection_essentials.json")

  parameters_override = {
    "workspaceName" = var.log_analytics_workspace_name,
    "location"      = var.location
  }
}

# Enable Sentinel Cloud Identity Threat Protection Essentials Solution
module "mod_deploy_cloud_identity_threat_protection_essentials" {
  source  = "azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group"
  version = "~> 1.0"
  count   = var.enable_solution_cloud_identity_threat_protection_essentials ? 1 : 0

  name                = "deploy_cloud_identity_threat_protection_essentials_content_solution"
  resource_group_name = var.resource_group_name
  deployment_mode     = var.deployment_mode
  deploy_environment  = var.deploy_environment
  workload_name       = "solutions"

  arm_script = file("${path.module}/sentinel/cloud_identity_threat_protection_essentials.json")

  parameters_override = {
    "workspaceName" = var.log_analytics_workspace_name,
    "location"      = var.location
  }
}

# Enable Sentinel Cloud Service Threat Protection Essentials Solution
module "mod_deploy_cloud_service_threat_protection_essentials" {
  source  = "azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group"
  version = "~> 1.0"
  count   = var.enable_solution_cloud_service_threat_protection_essentials ? 1 : 0

  name                = "deploy_cloud_service_threat_protection_essentials_content_solution"
  resource_group_name = var.resource_group_name
  deployment_mode     = var.deployment_mode
  deploy_environment  = var.deploy_environment
  workload_name       = "solutions"

  arm_script = file("${path.module}/sentinel/cloud_service_threat_protection_essentials.json")

  parameters_override = {
    "workspaceName" = var.log_analytics_workspace_name,
    "location"      = var.location
  }
}

# Enable Sentinel Endpoint Threat Protection Essentials Solution
module "mod_deploy_endpoint_threat_protection_essentials" {
  source  = "azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group"
  version = "~> 1.0"
  count   = var.enable_solution_endpoint_threat_protection_essentials ? 1 : 0

  name                = "deploy_endpoint_threat_protection_essentials_content_solution"
  resource_group_name = var.resource_group_name
  deployment_mode     = var.deployment_mode
  deploy_environment  = var.deploy_environment
  workload_name       = "solutions"

  arm_script = file("${path.module}/sentinel/endpoint_threat_protection_essentials.json")

  parameters_override = {
    "workspaceName" = var.log_analytics_workspace_name,
    "location"      = var.location
  }
}

# Enable Sentinel Network Session Essentials Solution
module "mod_deploy_network_session_essentials" {
  source  = "azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group"
  version = "~> 1.0"
  count   = var.enable_solution_network_session_essentials ? 1 : 0

  name                = "deploy_network_session_essentials_content_solution"
  resource_group_name = var.resource_group_name
  deployment_mode     = var.deployment_mode
  deploy_environment  = var.deploy_environment
  workload_name       = "solutions"

  arm_script = file("${path.module}/sentinel/network_session_essentials.json")

  parameters_override = {
    "workspaceName" = var.log_analytics_workspace_name,
    "location"      = var.location
  }
}

# Enable Sentinel Network Threat Protection Essentials Solution
module "mod_deploy_network_threat_protection_essentials" {
  source  = "azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group"
  version = "~> 1.0"
  count   = var.enable_solution_network_threat_protection_essentials ? 1 : 0

  name                = "deploy_network_threat_protection_essentials_content_solution"
  resource_group_name = var.resource_group_name
  deployment_mode     = var.deployment_mode
  deploy_environment  = var.deploy_environment
  workload_name       = "solutions"

  arm_script = file("${path.module}/sentinel/network_threat_protection_essentials.json")

  parameters_override = {
    "workspaceName" = var.log_analytics_workspace_name,
    "location"      = var.location
  }
}

# Enable Sentinel Network Threat Protection Essentials Solution
module "mod_deploy_security_threat_essentials" {
  source  = "azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group"
  version = "~> 1.0"
  count   = var.enable_solution_security_threat_essentials ? 1 : 0

  name                = "deploy_security_threat_essentials_content_solution"
  resource_group_name = var.resource_group_name
  deployment_mode     = var.deployment_mode
  deploy_environment  = var.deploy_environment
  workload_name       = "solutions"

  arm_script = file("${path.module}/sentinel/security_threat_essentials.json")

  parameters_override = {
    "workspaceName" = var.log_analytics_workspace_name,
    "location"      = var.location
  }
}