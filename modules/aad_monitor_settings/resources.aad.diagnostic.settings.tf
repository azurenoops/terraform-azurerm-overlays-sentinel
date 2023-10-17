# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# Enable Azure Active Directory Diagnostic Settings in Sentinel
resource "azurerm_monitor_aad_diagnostic_setting" "aad_diagnostic_settings" {
  name                       = "aad_diagnostic_settings"
  log_analytics_workspace_id = var.log_analytics_workspace_id
  storage_account_id         = var.log_analytics_storage_account_id

  # Enable Azure Active Directory Sign In Logs in Sentinel
  dynamic "enabled_log" {
    for_each = var.enable_sign_in_logs == true ? [1] : []
    content {
      category = "SignInLogs"
      retention_policy {
        enabled = var.enable_sign_in_logs
      }
    }
  }

  # Enable Azure Active Directory Audit Logs in Sentinel
  dynamic "enabled_log" {
    for_each = var.enable_audit_logs == true ? [1] : []
    content {
      category = "AuditLogs"
      retention_policy {
        enabled = var.enable_audit_logs
      }
    }
  }

  # Enable Azure Active Directory Non Interactive User Sign In Logs in Sentinel
  dynamic "enabled_log" {
    for_each = var.enable_non_interactive_user_sign_in_logs == true ? [1] : []
    content {
      category = "NonInteractiveUserSignInLogs"
      retention_policy {
        enabled = var.enable_non_interactive_user_sign_in_logs
      }
    }
  }

  # Enable Azure Active Directory Service Principal Sign In Logs in Sentinel
  dynamic "enabled_log" {
    for_each = var.enable_service_principal_sign_in_logs == true ? [1] : []
    content {
      category = "ServicePrincipalSignInLogs"
      retention_policy {
        enabled = var.enable_service_principal_sign_in_logs
      }
    }
  }

  # Enable Azure Active Directory Managed Identity Sign In Logs in Sentinel
  dynamic "enabled_log" {
    for_each = var.enable_managed_identity_sign_in_logs == true ? [1] : []
    content {
      category = "ManagedIdentitySignInLogs"
      retention_policy {
        enabled = var.enable_managed_identity_sign_in_logs
      }
    }
  }

  # Enable Azure Active Directory Provisioning Logs in Sentinel
  # Not supported in US Gov
  dynamic "enabled_log" {
    for_each = var.enable_provisioning_logs == true ? [1] : []
    content {
      category = "ProvisioningLogs"
      retention_policy {
        enabled = var.enable_provisioning_logs
      }
    }
  }

  # Enable Azure Active Directory ADFS Sign In Logs in Sentinel
  dynamic "enabled_log" {
    for_each = var.enable_adfs_sign_in_logs == true ? [1] : []
    content {
      category = "ADFSSignInLogs"
      retention_policy {
        enabled = var.enable_adfs_sign_in_logs
      }
    }
  }

  # Enable Azure Active Directory User Risk Events in Sentinel
  dynamic "enabled_log" {
    for_each = var.enable_user_risk_events == true ? [1] : []
    content {
      category = "UserRiskEvents"
      retention_policy {
        enabled = var.enable_user_risk_events
      }
    }
  }

  # Enable Azure Active Directory Risky Events in Sentinel
  dynamic "enabled_log" {
    for_each = var.enable_risky_events == true ? [1] : []
    content {
      category = "RiskyUsers"
      retention_policy {
        enabled = var.enable_risky_events
      }
    }
  }

  # Enable Azure Active Directory Network Access Traffic Logs in Sentinel
  # Not supported in US Gov
  dynamic "enabled_log" {
    for_each = var.enable_network_access_traffic_logs == true ? [1] : []
    content {
      category = "NetworkAccessTrafficLogs"
      retention_policy {
        enabled = var.enable_network_access_traffic_logs
      }
    }
  }

  # Enable Azure Active Directory Risky Service Principals in Sentinel
  dynamic "enabled_log" {
    for_each = var.enable_risky_service_principals == true ? [1] : []
    content {
      category = "RiskyServicePrincipals"
      retention_policy {
        enabled = var.enable_risky_service_principals
      }
    }
  }

  # Enable Azure Active Directory Service Principal Risk Events in Sentinel
  dynamic "enabled_log" {
    for_each = var.enable_service_principal_risk_events == true ? [1] : []
    content {
      category = "ServicePrincipalRiskEvents"
      retention_policy {
        enabled = var.enable_service_principal_risk_events
      }
    }
  }
}
