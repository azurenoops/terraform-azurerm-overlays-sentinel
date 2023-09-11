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

      query = <<EOF
      union isfuzzy=true 
      (
      SecurityEvent
      | where EventID == 4738
      // 2089 value indicates the Don't Expire Password value has been set
      | where UserAccountControl has "%%2089" 
      | extend Value_2089 = iff(UserAccountControl has "%%2089","'Don't Expire Password' - Enabled", "Not Changed")
      // 2050 indicates that the Password Not Required value is NOT set, this often shows up at the same time as a 2089 and is the recommended value.  This value may not be in the event. 
      | extend Value_2050 = iff(UserAccountControl has "%%2050","'Password Not Required' - Disabled", "Not Changed")
      // If value %%2082 is present in the 4738 event, this indicates the account has been configured to logon WITHOUT a password. Generally you should only see this value when an account is created and only in Event 4720: Account Creation Event.  
      | extend Value_2082 = iff(UserAccountControl has "%%2082","'Password Not Required' - Enabled", "Not Changed")
      | project StartTime = TimeGenerated, EventID, Activity, Computer, TargetAccount, TargetSid, AccountType, UserAccountControl, Value_2089, Value_2050, Value_2082, SubjectAccount
      | extend timestamp = StartTime, AccountCustomEntity = TargetAccount, HostCustomEntity = Computer
      ),
      (
      WindowsEvent
      | where EventID == 4738 and EventData has '2089'
      // 2089 value indicates the Don't Expire Password value has been set
      | extend UserAccountControl = tostring(EventData.UserAccountControl)
      | where UserAccountControl has "%%2089" 
      | extend Value_2089 = iff(UserAccountControl has "%%2089","'Don't Expire Password' - Enabled", "Not Changed")
      // 2050 indicates that the Password Not Required value is NOT set, this often shows up at the same time as a 2089 and is the recommended value.  This value may not be in the event. 
      | extend Value_2050 = iff(UserAccountControl has "%%2050","'Password Not Required' - Disabled", "Not Changed")
      // If value %%2082 is present in the 4738 event, this indicates the account has been configured to logon WITHOUT a password. Generally you should only see this value when an account is created and only in Event 4720: Account Creation Event.  
      | extend Value_2082 = iff(UserAccountControl has "%%2082","'Password Not Required' - Enabled", "Not Changed")
      | extend Activity="4738 - A user account was changed."
      | extend TargetAccount = strcat(EventData.TargetDomainName,"\\", EventData.TargetUserName)
      | extend TargetSid = tostring(EventData.TargetSid)
      | extend SubjectAccount = strcat(EventData.SubjectDomainName,"\\", EventData.SubjectUserName)
      | extend SubjectUserSid = tostring(EventData.SubjectUserSid)
      | extend AccountType=case(SubjectAccount endswith "$" or SubjectUserSid in ("S-1-5-18", "S-1-5-19", "S-1-5-20"), "Machine", isempty(SubjectUserSid), "", "User")
      | project StartTime = TimeGenerated, EventID, Activity, Computer, TargetAccount, TargetSid, AccountType, UserAccountControl, Value_2089, Value_2050, Value_2082, SubjectAccount
      | extend timestamp = StartTime, AccountCustomEntity = TargetAccount, HostCustomEntity = Computer
      )
      EOF


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

