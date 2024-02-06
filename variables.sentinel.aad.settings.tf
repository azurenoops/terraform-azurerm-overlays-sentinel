# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

variable "data_connector_aad_enabled" {
  description = "Whether the Azure Active Directory logs are retrieved."
  type        = bool
  default     = true
}

variable "data_connector_aad_logs" {
  description = "List of Azure Active Directory log category."
  type        = list(string)
  default     = ["AuditLogs", "SignInLogs", "NonInteractiveUserSignInLogs", "ServicePrincipalSignInLogs", "ManagedIdentitySignInLogs", "ProvisioningLogs", "ADFSSignInLogs", "RiskyUsers", "UserRiskEvents", "NetworkAccessTrafficLogs", "RiskyServicePrincipals", "ServicePrincipalRiskEvents", "EnrichedOffice365AuditLogs", "MicrosoftGraphActivityLogs"]
}
