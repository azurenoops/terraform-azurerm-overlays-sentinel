# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

variable "enable_solution_kql_training" {
  description = "Enable KQL Training Solution in Sentinel. Default is false."
  type        = bool
  default     = false  
}

variable "enable_solution_training_lab" {
  description = "Enable Training Lab Solution in Sentinel. Default is false."
  type        = bool
  default     = false  
}