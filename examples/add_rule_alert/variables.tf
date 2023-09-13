variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace in which Azure Sentinel is deployed."
  type        = string
  default     = ""
}

variable "sentinel_rule_alerts" {
  description = "A map of alerts to be created."
  type = map(object({
    query_frequency = string
    query_period    = string
    severity        = string
    query           = string

    entity_mappings = list(object({
      entity_type = string
      field_mappings = list(object({
        column_name = string
        identifier = string
      }))
    }))

    tactics    = optional(list(string))
    techniques = optional(list(string))

    display_name = string
    description  = string

    #Incident Configuration Block
    create_incident = bool
    # Grouping Block in incident_configuration block
    incident_configuration = object({
      enabled                 = bool
      lookback_duration       = string
      reopen_closed_incidents = bool
      entity_matching_method  = string
      group_by_entities       = list(string)
      group_by_alert_details  = list(string)
    })

    suppression_duration = optional(string)
    suppression_enabled  = optional(bool)
    event_grouping       = optional(string)
  }))
  default = {
    "AAD_No_Password_Expiry" = {
      query_frequency = "P1D"
      query_period    = "P1D"
      severity        = "Low"

      query = "SecurityEvent | where EventID == \"4688\" | where AccountType == \"User\" | where Account =~ \"NT AUTHORITY\\SYSTEM\" | where NewProcessName =~ \"C:\\\\Windows\\\\System32\\\\svchost.exe\" | where CommandLine =~ \"-k netsvcs\" | where NewProcessId == \"4\" | where ParentProcessName =~ \"C:\\\\Windows\\\\System32\\\\services.exe\" | where ParentProcessId == \"552\" | where SubjectLogonId == \"0x3e4\" | where SubjectUserName =~ \"NT AUTHORITY\\\\SYSTEM\" | where S"

      entity_mappings = [
        {
          entity_type = "Account"
          field_mappings = [{
            identifier = "FullName"
            column_name = "AccountCustomEntity"
          }]
        },
        {
          entity_type = "Host"
          field_mappings = [{
            identifier = "HostName"
            column_name = "HostCustomEntity"
          }]
        }

      ]

      tactics    = ["Persistence"]
      techniques = ["T1098"]

      display_name = "AAD_No_Password_Expiry"
      description  = <<EOT
Identifies whenever a user account has the setting "Password Never Expires" in the user account properties selected.
This is indicated in Security event 4738 in the EventData item labeled UserAccountControl with an included value of %%2089.
%%2089 resolves to "Don't Expire Password - Enabled".
EOT

      create_incident  = true      

      incident_configuration = {
        enabled                 = true
        lookback_duration       = "P1D"
        reopen_closed_incidents = true
        entity_matching_method  = "AllEntities"
        group_by_entities       = []
        group_by_alert_details  = ["Severity"]
      }

      suppression_duration = "P1D"
      suppression_enabled  = true
      event_grouping       = "SingleAlert"
    }, # End Alert   
  }    # End Alert Rules
}      # End locals

