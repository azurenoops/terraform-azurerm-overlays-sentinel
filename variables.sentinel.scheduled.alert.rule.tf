# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

variable "scheduled_alert_rules" {
  description = "Map of scheduled alert rules."
  type = map(object({
    display_name                = string   
    name                        = string
    query                       = string
    severity                    = string
    alert_rule_template_guid    = optional(string)
    alert_rule_template_version = optional(string)
    custom_details              = optional(map(string), {})
    description                 = optional(string)
    enabled                     = optional(bool, false)
    suppression_duration        = optional(string)
    suppression_enabled         = optional(bool, false)
    tactics                     = optional(list(string), [])
    techniques                  = optional(list(string), [])
    alert_details_override = optional(list(object({
      description_format   = optional(string)
      display_name_format  = optional(string)
      severity_column_name = optional(string)
      tactics_column_name  = optional(string)
      dynamic_property = optional(list(object({
        name  = string
        value = string
      })), [])
    })), [])
    entity_mapping = optional(list(object({
      entity_type = string
      field_mapping = optional(list(object({
        column_name = string
        identifier  = string
      })), [])
    })), [])
    event_grouping = optional(list(object({
      aggregation_method = string
    })), [])
    incident_configuration = optional(list(object({
      create_incident = bool
      grouping = optional(list(object({
        enabled                 = optional(bool, false)
        lookback_duration       = optional(string)
        reopen_closed_incidents = optional(bool, false)
        entity_matching_method  = optional(string)
        group_by_entities       = optional(set(string))
        group_by_alert_details  = optional(set(string))
        group_by_custom_details = optional(set(string))
      })), [])
    })), [])
    sentinel_entity_mapping = optional(list(object({
      column_name = string
    })), [])
  }))
  default = {}
}
