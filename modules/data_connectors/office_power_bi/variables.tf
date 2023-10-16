# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

variable "log_analytics_workspace_id" {
  description = "(Required) The ID of the Log Analytics Workspace to which the connector should be attached."
  type        = string
}

variable "tenant_id" {
  description = "The ID of the tenant that this Office Information Protection Data Connector connects to."
  type        = string
  default     = null
}
