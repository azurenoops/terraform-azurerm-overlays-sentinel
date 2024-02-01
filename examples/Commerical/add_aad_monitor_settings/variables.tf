# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

variable "data_connector_aad_logs" {
  description = "List of Azure Active Directory log category."
  type        = list(string)
  default     = ["AuditLogs", "SignInLogs", "NonInteractiveUserSignInLogs", "ServicePrincipalSignInLogs", "ManagedIdentitySignInLogs", "ProvisioningLogs", "ADFSSignInLogs", "RiskyUsers", "UserRiskEvents", "NetworkAccessTrafficLogs", "RiskyServicePrincipals", "ServicePrincipalRiskEvents", "EnrichedOffice365AuditLogs", "MicrosoftGraphActivityLogs"]
}

variable "retention_policy_days" {
  description = "Number of days to retain the logs. Default is 1 day."
  type        = number
  default     = 1  
}