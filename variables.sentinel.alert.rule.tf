# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

variable "fusion_alert_rules" {
  description = "The Fusion alert rules to deploy."
  type = map(object({    
    alert_rule_template_guid = optional(string)
    enabled = optional(bool, false)
  }))
  default = null
}

variable "machine_learning_alert_rules" {
  description = "The Machine Learning alert rules to deploy. "
  type = map(object({    
    alert_rule_template_guid = optional(string)
    enabled = optional(bool, false)
  }))
  default = null
}

variable "ms_security_incident_alert_rules" {
  description = "The MS Security Incident alert rules to deploy. "
  type = map(object({    
    product_filter = optional(string)
    display_name = optional(string)
    severity_filter = optional(list(string))
    alert_rule_template_guid = optional(string)
    description = optional(string)
    enabled = optional(bool, false)
  }))
  default = null
}
