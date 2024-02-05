# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.


# Enable Sentinel KQL Training Solution
module "mod_kql_training" {
  source  = "azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group"
  version = "~> 1.0"
  count   = var.enable_solution_kql_training ? 1 : 0

  name                = "deploy_kql_training_content_solution"
  resource_group_name = var.resource_group_name
  deployment_mode     = var.deployment_mode
  deploy_environment  = var.deploy_environment
  workload_name       = "solutions"

  arm_script = file("${path.module}/sentinel/KQLTraining.json")

  parameters_override = {
    "workspaceName" = var.log_analytics_workspace_name,
    "location"      = var.log_analytics_workspace_location
  }
}

# Enable Sentinel Training Lab Solution
module "mod_training_lab" {
  source  = "azurenoops/overlays-arm-deployment/azurerm//modules/azure_arm_deployment/resource_group"
  version = "~> 1.0"
  count   = var.enable_solution_training_lab ? 1 : 0

  name                = "deploy_training_lab_content_solution"
  resource_group_name = var.resource_group_name
  deployment_mode     = var.deployment_mode
  deploy_environment  = var.deploy_environment
  workload_name       = "solutions"

  arm_script = file("${path.module}/sentinel/training_lab.json")

  parameters_override = {
    "workspaceName" = var.log_analytics_workspace_name,
    "location"      = var.log_analytics_workspace_location
  }
}
