# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

#####################################
# DEPLOY AZURE SENTINEL ONBOARDING ##
#####################################

resource "azurerm_sentinel_log_analytics_workspace_onboarding" "sentinel" {
  workspace_id = var.log_analytics_workspace_id
}