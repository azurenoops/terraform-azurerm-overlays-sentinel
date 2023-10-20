# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# Enable Azure Active Directory Solution in Sentinel 
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