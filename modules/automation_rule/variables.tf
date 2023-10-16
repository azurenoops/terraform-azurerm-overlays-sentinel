# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

variable "workload_name" {
  description = "Name of the workload. This will be used to name the resources deployed by this module."
  type        = string
}

variable "deploy_environment" {
  description = "Name of the workload's environnement (dev, test, prod, etc). This will be used to name the resources deployed by this module. default is 'dev'"
  type        = string
}

variable "name" {
  description = "The name to assign to the alert rule."
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace in which Azure Sentinel is deployed."
  type        = string
}

variable "file_path" {
  description = "The file path to the automation rule."
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "The name of the resource group in which the playbook is provisioned."
  type        = string
}

variable "unique_name_prefix" {
  description = "A unique string prepended to the resource name to ensure it is globally unique (i.e. your company name)."
  type        = string
}

variable "environment" {
  description = "The type of environment (e.g. `dev`, `stage`, or `prod`)."
  type        = string
}