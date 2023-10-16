# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace in which Azure Sentinel is deployed."
  type        = string
}

variable "alert_rule_template_guid" {
  description = "The GUID of the alert rule template to use. This is the GUID of the alert rule template in the Azure Sentinel workspace."
  type        = string
}

variable "enable_rule_alert" {
  description = "Indicates whether the alert rule is enabled."
  type        = bool
  default     = true
}