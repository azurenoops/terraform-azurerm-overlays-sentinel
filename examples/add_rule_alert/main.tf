

module "mod_sentinel_rules" {
  #source = "azurenoops/overlays-sentinel/azurerm//modules/scheduled_alert_rule"  
  #version = "x.x.x"  
  source   = "../../modules/scheduled_alert_rule"
  depends_on = [ azurerm_log_analytics_workspace.sentinel_workspace,azurerm_log_analytics_solution.solutions ]
  for_each = var.sentinel_rule_alerts

  deploy_environment         = "dev"
  workload_name              = "sentinel"
  name                       = each.key
  log_analytics_workspace_id = azurerm_log_analytics_workspace.sentinel_workspace.id
  description                = each.value.description
  query_frequency            = each.value.query_frequency
  query_period               = each.value.query_period
  severity                   = each.value.severity
  query                      = each.value.query
  entity_mappings            = each.value.entity_mappings
  tactics                    = each.value.tactics
  techniques                 = each.value.techniques
  display_name               = each.value.display_name
  enabled                    = each.value.incident_configuration.enabled
  create_incident            = each.value.create_incident
  reopen_closed_incidents    = each.value.incident_configuration.reopen_closed_incidents
  lookback_duration          = each.value.incident_configuration.lookback_duration
  entity_matching_method     = each.value.incident_configuration.entity_matching_method
  group_by_entities          = each.value.incident_configuration.group_by_entities
  group_by_alert_details     = each.value.incident_configuration.group_by_alert_details
  suppression_duration       = each.value.suppression_duration
  suppression_enabled        = each.value.suppression_enabled
  aggregation_method         = each.value.event_grouping
}
