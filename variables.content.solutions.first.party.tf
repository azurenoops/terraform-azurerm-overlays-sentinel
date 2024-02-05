# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

variable "enable_solution_azure_ad" {
  description = "Enable Azure Active Directory Solution in Sentinel. Default is false."
  type        = bool
  default     = false
}

variable "enable_solution_azure_activity" {
  description = "Enable Azure Activity Solution in Sentinel. Default is false."
  type        = bool
  default     = false
}

variable "enable_solution_microsoft_365" {
  description = "Enable Microsoft 365 Solution in Sentinel. Default is false."
  type        = bool
  default     = false
}

variable "enable_solution_microsoft_teams" {
  description = "Enable Microsoft Teams Solution in Sentinel. Default is false."
  type        = bool
  default     = false
}

variable "enable_solution_threat_intelligence" {
  description = "Enable Threat Intelligence Solution in Sentinel. Default is false."
  type        = bool
  default     = false
}

variable "enable_solution_microsoft_defender_for_cloud" {
  description = "Enable Microsoft Defender for Cloud Solution in Sentinel. Default is false."
  type        = bool
  default     = false
}

variable "enable_solution_microsoft_defender_for_iot" {
  description = "Enable Microsoft Defender for IoT Solution in Sentinel. Default is false."
  type        = bool
  default     = false
}

variable "enable_solution_microsoft_defender_for_endpoint" {
  description = "Enable Microsoft Defender for Endpoint Solution in Sentinel. Default is false."
  type        = bool
  default     = false
}

variable "enable_solution_microsoft_dynamics_365" {
  description = "Enable Microsoft Dynamics 365 Solution in Sentinel. Default is false."
  type        = bool
  default     = false
}

variable "enable_solution_office_insider_risk_management" {
  description = "Enable Office Insider Risk Management Solution in Sentinel. Default is false."
  type        = bool
  default     = false
}

variable "enable_solution_office_365_project" {
  description = "Enable Office 365 Project Solution in Sentinel. Default is false."
  type        = bool
  default     = false
}

variable "enable_solution_office_365_powerbi" {
  description = "Enable Office 365 PowerBI Solution in Sentinel. Default is false."
  type        = bool
  default     = false
}

variable "enable_solution_soc_handbook" {
  description = "Enable SOC Handbook Solution in Sentinel. Default is false."
  type        = bool
  default     = false
}

variable "enable_solution_soc_process_fx" {
  description = "Enable SOC Process FX Solution in Sentinel. Default is false."
  type        = bool
  default     = false  
}