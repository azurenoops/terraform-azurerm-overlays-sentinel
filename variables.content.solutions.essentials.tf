# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

variable "enable_solution_soar_essentials" {
  description = "Enable SOAR Essentials Solution in Sentinel. Default is false."
  type        = bool
  default     = false  
}

variable "enable_solution_ueba_essentials" {
  description = "Enable UEBA Essentials Solution in Sentinel. Default is false."
  type        = bool
  default     = false  
}

variable "enable_solution_attacker_tools_threat_protection_essentials" {
  description = "Enable Attacker Tools Threat Protection Essentials Solution in Sentinel. Default is false."
  type        = bool
  default     = false  
}

variable "enable_solution_cloud_identity_threat_protection_essentials" {
  description = "Enable Cloud Identity Threat Protection Essentials Solution in Sentinel. Default is false."
  type        = bool
  default     = false  
}

variable "enable_solution_cloud_service_threat_protection_essentials" {
  description = "Enable Cloud Service Threat Protection Essentials Solution in Sentinel. Default is false."
  type        = bool
  default     = false    
}

variable "enable_solution_endpoint_threat_protection_essentials" {
  description = "Enable Endpoint Threat Protection Essentials Solution in Sentinel. Default is false."
  type        = bool
  default     = false      
}

variable "enable_solution_network_session_essentials" {
  description = "Enable Network Session Essentials Solution in Sentinel. Default is false."
  type        = bool
  default     = false   
}

variable "enable_solution_network_threat_protection_essentials" {
  description = "Enable Network Threat Protection Essentials Solution in Sentinel. Default is false."
  type        = bool
  default     = false   
}

variable "enable_solution_security_threat_essentials" {
  description = "Enable Security Threat Essentials Solution in Sentinel. Default is false."
  type        = bool
  default     = false   
}