# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DEPLOY AZURE SENTINEL ROLES
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "azurerm_role_assignment" "sec_owner" {
  scope                = data.azurerm_subscription.security.id
  role_definition_name = "Security Administrator"
  principal_id         = var.existing_principal_id == null ? data.azurerm_client_config.current.object_id : var.existing_principal_id
}