
variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace to onboard to Azure Sentinel"
  type        = string  
}

variable "log_analytics_workspace_name" {
  description = "The name of the Log Analytics Workspace to onboard to Azure Sentinel. This is only used in Hub Content Solutions."
  type        = string
  default = null 
}

variable "log_analytics_workspace_location" {
  description = "The name of the Resource Group in which the Log Analytics Workspace is located. This is only used in Hub Content Solutions."
  type        = string
  default = null 
}

variable "resource_group_name" {
  description = "The name of the Resource Group in which the Log Analytics Workspace is located. This is only used in Hub Content Solutions."
  type        = string
  default = null  
}

variable "deploy_environment" {
  description = "Name of the workload's environnement (dev, test, prod, etc). This will be used to name the resources deployed by this module. default is 'dev'"
  type        = string
}

variable "deployment_mode" {
  # https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/deployment-modes
  description = "The Deployment Mode for this Resource Group Template Deployment. Possible values are Complete (where resources in the Resource Group not specified in the ARM Template will be destroyed) and Incremental (where resources are additive only). This is only used in Hub Content Solutions."
  type        = string
  default     = "Incremental"

  validation {
    condition     = contains(["Incremental", "Complete"], var.deployment_mode)
    error_message = "This value must be either Incremental or Complete."
  }
}