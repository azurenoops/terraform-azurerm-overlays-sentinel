# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

variable "workload_name" {
  description = "Name of the workload. This will be used to name the resources deployed by this module."
  type        = string
}

variable "deploy_environment" {
  description = "Name of the workload's environnement (dev, test, prod, etc). This will be used to name the resources deployed by this module. default is 'dev'"
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace in which Azure Sentinel is deployed."
  type        = string
}

variable "tenant_id" {
  description = "The ID of the tenant in which Azure Sentinel is deployed."
  type        = string  
}

variable "display_name" {
  type = string
}

variable "unique_prefix" {
  description = "Unique string used to generate a UUID."
  type        = string
}

# The default condition is when Status = Active
variable "conditions" {
  default = []

  type = list(object({
    operator = string
    property = string
    values   = list(string)
  }))
}

variable "log_analytics_workspace_id" {
  type = string
}

variable "logic_app_id" {
  type = string
}

variable "rule_order" {
  description = "The order of this Sentinel Automation Rule"
  type        = number
  default     = 1
}

variable "action_order" {
  description = "The execution order of this action"
  type        = number
  default     = 1
}

variable "enabled" {
  type    = bool
  default = false
}

variable "expiration" {
  description = "The UTC time in RFC3339 format"
  type        = string
  default     = null
}