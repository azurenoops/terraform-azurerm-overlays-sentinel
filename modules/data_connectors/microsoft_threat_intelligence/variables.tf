# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

variable "log_analytics_workspace_id" {
  description = "(Required) The ID of the Log Analytics Workspace to which the connector should be attached."
  type        = string
}

variable "microsoft_emerging_threat_feed_lookback_date" {
  description = "(Optional) The date from which to start collecting data from the Microsoft Emerging Threats feed. Defaults to 1970-01-01T00:00:00Z."
  type        = string
  default     = "1970-01-01T00:00:00Z"
}