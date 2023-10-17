variable "name" {
  description = "The name to assign to the alert rule."
  type        = string
  default = "fusion_alert_rule"
}

variable "enable_rule_alert" {
  description = "Indicates whether the alert rule is enabled."
  type        = bool
  default     = true
}