# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

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

variable "enable_rule_alert" {
  description = "Indicates whether the alert rule is enabled."
  type        = bool
  default     = true
}