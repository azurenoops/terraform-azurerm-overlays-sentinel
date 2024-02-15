# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.


# Enable Sentinel KQL Training Solution
module "mod_kql_training" {
  depends_on = [ azurerm_sentinel_log_analytics_workspace_onboarding.sentinel ]
  source  = "azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group"
  version = "~> 1.0"
  count   = var.enable_solution_kql_training ? 1 : 0

  name                = "deploy_kql_training_content_solution"
  resource_group_name = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.resource_group_name
  deployment_mode     = var.deployment_mode
  deploy_environment  = var.deploy_environment
  workload_name       = "solutions"

  arm_script = file("${path.module}/sentinel/KQLTraining.json")

  parameters_override = {
    "workspaceName" = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_name,
    "location"      = var.log_analytics_workspace_location
  }
}

# Enable Sentinel Training Lab Solution
module "mod_training_lab" {
  depends_on = [ azurerm_sentinel_log_analytics_workspace_onboarding.sentinel ]
  source  = "azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group"
  version = "~> 1.0"
  count   = var.enable_solution_training_lab ? 1 : 0

  name                = "deploy_training_lab_content_solution"
  resource_group_name = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.resource_group_name
  deployment_mode     = var.deployment_mode
  deploy_environment  = var.deploy_environment
  workload_name       = "solutions"

  arm_script = file("${path.module}/sentinel/training_lab.json")

  parameters_override = {
    "workspaceName" = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_name,
    "location"      = var.log_analytics_workspace_location
  }
}
