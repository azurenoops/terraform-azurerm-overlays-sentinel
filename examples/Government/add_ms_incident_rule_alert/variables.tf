variable "display_name" {
  description = "The display name of the alert rule."
  type        = string
  default = "Create incidents based on all alerts generated in Azure Security Center"
}

variable "description" {
  description = "The description of the alert rule."
  type        = string
  default = "Create incidents based on Azure Security Center alerts"
}

variable "alert_rule_template_guid" {
  description = "The GUID of the alert rule template to use. This is the GUID of the alert rule template in the Azure Sentinel workspace."
  type        = string
  default = "90586451-7ba8-4c1e-9904-7d1b7c3cc4d6"
}

variable "product_filter" {
  description = "The product filter to use for the alert rule. This is the product filter in the alert rule template in the Azure Sentinel workspace."
  type        = string
  default = "Azure Security Center"
}

variable "severity_filter" {
  description = "The severity filter to use for the alert rule. This is the severity filter in the alert rule template in the Azure Sentinel workspace."
  type        = set(string)
  default     = ["High"]
}