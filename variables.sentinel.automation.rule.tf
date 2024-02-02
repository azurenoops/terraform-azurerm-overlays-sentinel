# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

variable "automation_rules" {
  description = "Map of automation rules."
  type = map(object({
    display_name               = string    
    name                       = string
    order                      = number
    condition_json             = optional(string)
    enabled                    = optional(bool, false)
    expiration                 = optional(string)
    triggers_on                = optional(string)
    triggers_when              = optional(string)
    action_incident = optional(list(object({
      order                  = number
      status                 = optional(string)
      classification         = optional(string)
      classification_comment = optional(string)
      labels                 = optional(list(string))
      owner_id               = optional(string)
      severity               = optional(string)
    })), [])
    action_playbook = optional(list(object({
      logic_app_id = optional(string)
      order        = optional(number)
      tenant_id    = optional(string)
    })), [])
  }))
  default = null
}
