# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

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

variable "data_connector_aad_logs" {
  description = "List of Azure Active Directory log category."
  type        = list(string)
  default     = ["AuditLogs", "SignInLogs", "NonInteractiveUserSignInLogs", "ServicePrincipalSignInLogs", "ManagedIdentitySignInLogs", "ProvisioningLogs", "ADFSSignInLogs", "RiskyUsers", "UserRiskEvents", "NetworkAccessTrafficLogs", "RiskyServicePrincipals", "ServicePrincipalRiskEvents", "EnrichedOffice365AuditLogs", "MicrosoftGraphActivityLogs"]
}