# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DEPLOY AZURE SENTINEL SCHEDULED ALERT RULES
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "azurerm_sentinel_alert_rule_scheduled" "rule" {
  name                       = var.name
  log_analytics_workspace_id = var.log_analytics_workspace_id
  display_name               = var.display_name
  severity                   = var.severity
  query                      = var.query
  tactics                    = var.tactics
  techniques                 = [for t in var.techniques : substr(t, 0, 5)] # The expected format is 'T####', where '#' represents a digit. No support for sub-techniques yet.
  description                = var.description
  enabled                    = var.enabled
  query_frequency            = var.query_frequency
  query_period               = var.query_period
  suppression_duration       = var.suppression_duration
  suppression_enabled        = var.suppression_enabled
  trigger_operator           = var.trigger_operator
  trigger_threshold          = var.trigger_threshold

  dynamic "incident_configuration" {
    for_each = local.incident_configuration
    content {
      create_incident = var.create_incident
      grouping {
        enabled                 = var.grouping
        lookback_duration       = var.lookback_duration
        reopen_closed_incidents = var.reopen_closed_incidents
        entity_matching_method  = var.entity_matching_method
        group_by_entities       = var.group_by_entities
        group_by_alert_details  = var.group_by_alert_details
        group_by_custom_details = var.group_by_custom_details
      }
    }
  }

  dynamic "entity_mapping" {
    for_each = var.entity_mappings
    content {
      entity_type = entity_mapping.value["entity_type"]
      dynamic "field_mapping" {
        for_each = entity_mapping.value["field_mappings"]
        content {
          identifier  = field_mapping.value["identifier"]
          column_name = field_mapping.value["column_name"]          
        }
      }
    }
  }

  event_grouping {
    aggregation_method = var.aggregation_method
  }
}
