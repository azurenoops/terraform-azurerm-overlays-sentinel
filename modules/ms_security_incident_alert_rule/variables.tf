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

variable "display_name" {
  description = "The display name of the alert rule."
  type        = string
}

variable "description" {
  description = "The description of the alert rule."
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace in which Azure Sentinel is deployed."
  type        = string
}

variable "alert_rule_template_guid" {
  description = "The GUID of the alert rule template to use. This is the GUID of the alert rule template in the Azure Sentinel workspace."
  type        = string
}

variable "product_filter" {
  description = "The product filter to use for the alert rule. This is the product filter in the alert rule template in the Azure Sentinel workspace."
  type        = string
}

variable "severity_filter" {
  description = "The severity filter to use for the alert rule. This is the severity filter in the alert rule template in the Azure Sentinel workspace."
  type        = set(string)
  default     = ["High"]
}
