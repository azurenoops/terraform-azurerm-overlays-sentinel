# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

provider "azurerm" {
  environment = "public"
  skip_provider_registration = true
  features {}
}