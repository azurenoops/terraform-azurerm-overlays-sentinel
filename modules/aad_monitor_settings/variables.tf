# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace in which Azure Sentinel is deployed."
  type        = string
}

variable "log_analytics_storage_account_id" {
  description = "The ID of the storage account in which Azure Sentinel logs are stored."
  type        = string
}

variable "enable_sign_in_logs" {
  description = "Enable Azure Active Directory Sign In Logs in Sentinel"
  type        = bool
  default     = false
}

variable "enable_audit_logs" {
  description = "Enable Azure Active Directory Audit Logs in Sentinel"
  type        = bool
  default     = false
}

variable "enable_non_interactive_user_sign_in_logs" {
  description = "Enable Azure Active Directory Non Interactive User Sign In Logs in Sentinel"
  type        = bool
  default     = false
}

variable "enable_service_principal_sign_in_logs" {
  description = "Enable Azure Active Directory Service Principal Sign In Logs in Sentinel"
  type        = bool
  default     = false
}

variable "enable_managed_identity_sign_in_logs" {
  description = "Enable Azure Active Directory Managed Identity Sign In Logs in Sentinel"
  type        = bool
  default     = false
}

variable "enable_provisioning_logs" {
  description = "Enable Azure Active Directory Provisioning Logs in Sentinel"
  type        = bool
  default     = false
}

variable "enable_adfs_sign_in_logs" {
  description = "Enable Azure Active Directory ADFS Sign In Logs in Sentinel"
  type        = bool
  default     = false
}

variable "enable_user_risk_events" {
  description = "Enable Azure Active Directory User Risk Events in Sentinel"
  type        = bool
  default     = false
}

variable "enable_risky_events" {
  description = "Enable Azure Active Directory Risky Events in Sentinel"
  type        = bool
  default     = false
}

variable "enable_network_access_traffic_logs" {
  description = "Enable Azure Active Directory Network Access Traffic Logs in Sentinel"
  type        = bool
  default     = false
}

variable "enable_risky_service_principals" {
  description = "Enable Azure Active Directory Risky Service Principals in Sentinel"
  type        = bool
  default     = false
}

variable "enable_service_principal_risk_events" {
  description = "Enable Azure Active Directory Service Principal Risk Events in Sentinel"
  type        = bool
  default     = false
}

