# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

variable "log_analytics_workspace_id" {
  description = "(Required) The ID of the Log Analytics Workspace to which the connector should be attached."
  type        = string
}

variable "subscription_id" {
  description = "The ID of the subscription that this Azure Security Center Data Connector connects to."
  type        = string
  default     = null
}