# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

variable "tenant_id" {
  description = "The ID of the tenant that this Azure Active Directory Data Connector connects to."
  type        = string
  default     = null
}

variable "subscription_id" {
  description = "The ID of the subscription that this Azure Security Center Data Connector connects to."
  type        = string
  default     = null  
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

variable "data_connectors" {
  description = "(Optional) The list of data connectors to enable for the Azure Security Center Data Connector. Defaults to ['AzureActiveDirectory']."
  type        = list(string)
  default     = [] 
}