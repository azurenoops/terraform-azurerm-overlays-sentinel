# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

locals {
  incident_configuration = var.create_incident == null ? [] : ["enabled"]
}