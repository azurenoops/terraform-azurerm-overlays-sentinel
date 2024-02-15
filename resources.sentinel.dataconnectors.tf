# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

################################################
# DEPLOY AZURE SENTINEL DATA CONNECTORS       ##
################################################

resource "azurerm_sentinel_data_connector_azure_active_directory" "data_connector_azure_active_directory" {
  depends_on = [ azurerm_sentinel_log_analytics_workspace_onboarding.sentinel ]
  count                      = contains(var.data_connectors, "AzureActiveDirectory") ? 1 : 0
  name                       = "data_connector_azure_active_directory"
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_id
}

resource "azurerm_sentinel_data_connector_azure_advanced_threat_protection" "data_connector_azure_advanced_threat_protection" {
  depends_on = [ azurerm_sentinel_log_analytics_workspace_onboarding.sentinel ]
  count                      = contains(var.data_connectors, "AzureAdvancedThreatProtection") ? 1 : 0
  name                       = "data_connector_azure_advanced_threat_protection"
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_id
}

resource "azurerm_sentinel_data_connector_azure_security_center" "data_connector_azure_security_center" {
  depends_on = [ azurerm_sentinel_log_analytics_workspace_onboarding.sentinel ]
  count                      = contains(var.data_connectors, "AzureSecurityCenter") ? 1 : 0
  name                       = "data_connector_azure_security_center"
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_id
}

resource "azurerm_sentinel_data_connector_dynamics_365" "data_connector_dynamics_365" {
  depends_on = [ azurerm_sentinel_log_analytics_workspace_onboarding.sentinel ]
  count                      = contains(var.data_connectors, "Dynamics365") ? 1 : 0
  name                       = "data_connector_dynamics_365"
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_id
}

resource "azurerm_sentinel_data_connector_iot" "data_connector_iot" {
  depends_on = [ azurerm_sentinel_log_analytics_workspace_onboarding.sentinel ]
  count                      = contains(var.data_connectors, "IoT") ? 1 : 0
  name                       = "data_connector_iot"
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_id
}

resource "azurerm_sentinel_data_connector_microsoft_cloud_app_security" "data_connector_microsoft_cloud_app_security" {
  depends_on = [ azurerm_sentinel_log_analytics_workspace_onboarding.sentinel ]
  count                      = contains(var.data_connectors, "MicrosoftCloudAppSecurity") ? 1 : 0
  name                       = "data_connector_microsoft_cloud_app_security"
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_id
}

resource "azurerm_sentinel_data_connector_microsoft_defender_advanced_threat_protection" "data_connector_microsoft_defender_advanced_threat_protection" {
  depends_on = [ azurerm_sentinel_log_analytics_workspace_onboarding.sentinel ]
  count                      = contains(var.data_connectors, "MicrosoftDefenderAdvancedThreatProtection") ? 1 : 0
  name                       = "data_connector_microsoft_defender_advanced_threat_protection"
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_id
}

resource "azurerm_sentinel_data_connector_microsoft_threat_intelligence" "data_connector_microsoft_threat_intelligence" {
  depends_on = [ azurerm_sentinel_log_analytics_workspace_onboarding.sentinel ]
  count                                        = contains(var.data_connectors, "MicrosoftThreatIntelligence") ? 1 : 0
  name                                         = "data_connector_microsoft_threat_intelligence"
  log_analytics_workspace_id                   = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_id
  microsoft_emerging_threat_feed_lookback_date = "1970-01-01T00:00:00Z"
}

resource "azurerm_sentinel_data_connector_microsoft_threat_protection" "data_connector_microsoft_threat_protection" {
  depends_on = [ azurerm_sentinel_log_analytics_workspace_onboarding.sentinel ]
  count                      = contains(var.data_connectors, "MicrosoftThreatProtection") ? 1 : 0
  name                       = "data_connector_microsoft_threat_protection"
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_id
}

resource "azurerm_sentinel_data_connector_office_365" "data_connector_office_365" {
  depends_on = [ azurerm_sentinel_log_analytics_workspace_onboarding.sentinel ]
  count                      = contains(var.data_connectors, "Office365") ? 1 : 0
  name                       = "data_connector_office_365"
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_id
}

resource "azurerm_sentinel_data_connector_office_365_project" "data_connector_office_365_project" {
  depends_on = [ azurerm_sentinel_log_analytics_workspace_onboarding.sentinel ]
  count                      = contains(var.data_connectors, "Office365Project") ? 1 : 0
  name                       = "data_connector_office_365_project"
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_id
}

resource "azurerm_sentinel_data_connector_office_atp" "data_connector_office_atp" {
  depends_on = [ azurerm_sentinel_log_analytics_workspace_onboarding.sentinel ]
  count                      = contains(var.data_connectors, "OfficeATP") ? 1 : 0
  name                       = "data_connector_office_atp"
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_id
}

resource "azurerm_sentinel_data_connector_office_irm" "data_connector_office_irm" {
  depends_on = [ azurerm_sentinel_log_analytics_workspace_onboarding.sentinel ]
  count                      = contains(var.data_connectors, "OfficeIRM") ? 1 : 0
  name                       = "data_connector_office_irm"
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_id
}

resource "azurerm_sentinel_data_connector_office_power_bi" "data_connector_office_power_bi" {
  depends_on = [ azurerm_sentinel_log_analytics_workspace_onboarding.sentinel ]
  count                      = contains(var.data_connectors, "OfficePowerBI") ? 1 : 0
  name                       = "data_connector_office_power_bi"
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_id
}

resource "azurerm_sentinel_data_connector_threat_intelligence" "data_connector_threat_intelligence" {
  depends_on = [ azurerm_sentinel_log_analytics_workspace_onboarding.sentinel ]
  count                      = contains(var.data_connectors, "ThreatIntelligence") ? 1 : 0
  name                       = "data_connector_threat_intelligence"
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.sentinel.workspace_id
}