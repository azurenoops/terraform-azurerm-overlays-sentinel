# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

resource "azurerm_sentinel_log_analytics_workspace_onboarding" "sentinel" {
  workspace_id = var.log_analytics_workspace_id
}