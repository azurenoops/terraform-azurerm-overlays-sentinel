# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

variable "ueba_data_sources" {
  description = "List of UEBA (User and Entity Behavior Analytics) data sources."
  type        = list(string)
  default     = ["AuditLogs", "AzureActivity", "SecurityEvent", "SigninLogs"]
}

variable "ueba_entity_providers" {
  description = "List of UEBA (User and Entity Behavior Analytics) entity providers."
  type        = list(string)
  default     = ["AzureActiveDirectory"]
}

variable "log_analytics_workspace_name" {
  description = "Name of the Log Analytics workspace to use for UEBA (User and Entity Behavior Analytics)."
  type        = string
  default     = "ueba-laws"
}

variable "log_analytics_workspace_resource_group_name" {
  description = "Name of the resource group containing the Log Analytics workspace to use for UEBA (User and Entity Behavior Analytics)."
  type        = string
  default     = "ueba-rg"
}