# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.


variable "ms_security_incident_rule_alerts" {
  description = "(Optional) A map of MS Security Incident Alert Rules to deploy. The key is the name of the rule, and the value is a map of properties to use for the rule."
  type        = map(object({
    display_name               = string
    product_filter             = string
    severity_filter            = string
    alert_rule_template_guid   = string
    description                = string
    enable_rule_alert          = bool
  }))
  default     = null
  
}