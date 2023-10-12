# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

variable "log_analytics_workspace_id" {
  description = "(Required) The ID of the Log Analytics Workspace to which the connector should be attached."
  type        = string
}

variable "enable_exchange_connector" {
  description = "(Optional) Whether to enable the Exchange connector be enabled. Defaults to true."
  type        = bool
  default     = true
}

variable "enable_sharepoint_connector" {
  description = "(Optional) Whether to enable the SharePoint connector be enabled. Defaults to true."
  type        = bool
  default     = true
}

variable "enable_teams_connector" {
  description = "(Optional) Whether to enable the Teams connector be enabled. Defaults to true."
  type        = bool
  default     = true
}