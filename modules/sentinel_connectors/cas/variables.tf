# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

variable "log_analytics_workspace_id" {
  description = "(Required) The ID of the Log Analytics Workspace to which the connector should be attached."
  type        = string
}

variable "enable_alerts" {
  description = "(Optional) Whether to enable alerts for the connector. Defaults to true."
  type        = bool
  default     = true
}

variable "enable_discovery_logs" {
  description = "(Optional) Whether to enable discovery logs for the connector. Defaults to true."
  type        = bool
  default     = true
}