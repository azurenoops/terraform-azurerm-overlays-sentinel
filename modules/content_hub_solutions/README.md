# Azure Sentinel Content Hub Solutions Module Overlay

[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![MIT License](https://img.shields.io/badge/license-MIT-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/azurenoops/overlays-sentinel/azurerm/)

This Overlay terraform module can create Azure Sentinel Content Hub Solutions and manage related parameters to be used in a [SCCA compliant Network](https://registry.terraform.io/modules/azurenoops/overlays-management-hub/azurerm/latest).

## SCCA Compliance

This module can be SCCA compliant and can be used in a SCCA compliant Network. Enable private endpoints and SCCA compliant network rules to make it SCCA compliant.

For more information, please read the [SCCA documentation](https://docs.microsoft.com/en-us/azure/azure-government/documentation-government-get-started-connect-with-cli).

## Example Usage

```hcl  
module "mod_sentinel_content_hub_solutions" {
  source = "azurenoops/overlays-sentinel/azurerm//modules/aad_monitor_settings"  
  version = "x.x.x"  
  
  log_analytics_workspace_name = azurerm_log_analytics_workspace.sentinel_workspace.name
  location                     = azurerm_log_analytics_workspace.sentinel_workspace.location
  resource_group_name          = azurerm_resource_group.sentinel_rg.name
  deploy_environment           = "dev"
  enable_solution_azure_ad     = true
}
```
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.36 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.36 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_sentinel_alert_rule_scheduled.rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_alert_rule_scheduled) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_add_tags"></a> [add\_tags](#input\_add\_tags) | Map of custom tags. | `map(string)` | `{}` | no |
| <a name="input_aggregation_method"></a> [aggregation\_method](#input\_aggregation\_method) | The aggregation method to apply to the query results. One of `Count`, `Maximum`, `Minimum`, `Average`, `Total`, `None`. | `string` | `"Count"` | no |
| <a name="input_create_incident"></a> [create\_incident](#input\_create\_incident) | Whether or not an incident should be created from alerts triggered by this rule. | `bool` | `false` | no |
| <a name="input_default_tags_enabled"></a> [default\_tags\_enabled](#input\_default\_tags\_enabled) | Option to enable or disable default tags. | `bool` | `true` | no |
| <a name="input_deploy_environment"></a> [deploy\_environment](#input\_deploy\_environment) | Name of the workload's environnement (dev, test, prod, etc). This will be used to name the resources deployed by this module. default is 'dev' | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | The rule description. | `string` | n/a | yes |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | The friendly name of this rule. | `string` | n/a | yes |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Whether or not this rule is enabled. | `bool` | `true` | no |
| <a name="input_entity_mappings"></a> [entity\_mappings](#input\_entity\_mappings) | A list of entities or categories that are associated to the data that is being sent to Sentinel. | <pre>list(object({<br>    entity_type = string<br>    field_mappings = list(object({<br>      identifier = string<br>      column_name = string<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_entity_matching_method"></a> [entity\_matching\_method](#input\_entity\_matching\_method) | The method used to group incidents. | `string` | `"AnyAlert"` | no |
| <a name="input_group_by_alert_details"></a> [group\_by\_alert\_details](#input\_group\_by\_alert\_details) | A list of alert details to group by, only when the entity\_matching\_method is Selected. | `list(string)` | `[]` | no |
| <a name="input_group_by_custom_details"></a> [group\_by\_custom\_details](#input\_group\_by\_custom\_details) | A list of custom details keys to group by, only when the entity\_matching\_method is Selected. | `list(string)` | `[]` | no |
| <a name="input_group_by_entities"></a> [group\_by\_entities](#input\_group\_by\_entities) | A list of entity types to group by, only when the entity\_matching\_method is Selected. | `list(string)` | `[]` | no |
| <a name="input_grouping"></a> [grouping](#input\_grouping) | Enable grouping of incidents created from alerts triggered by this rule. | `bool` | `true` | no |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | The ID of the Log Analytics workspace in which Azure Sentinel is deployed. | `string` | n/a | yes |
| <a name="input_lookback_duration"></a> [lookback\_duration](#input\_lookback\_duration) | The duration of time in which new alerts should be associated to an existing related incident (in ISO 8601 duration format). | `string` | `"PT5H"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name to assign to the alert rule. | `string` | n/a | yes |
| <a name="input_query"></a> [query](#input\_query) | The Kusto (KQL) query run by this rule. | `string` | n/a | yes |
| <a name="input_query_frequency"></a> [query\_frequency](#input\_query\_frequency) | The ISO 8601 timespan duration between two consecutive queries. | `string` | `"PT5H"` | no |
| <a name="input_query_period"></a> [query\_period](#input\_query\_period) | The ISO 8601 timespan duration which determines the time period of the data covered by the query. | `string` | `"PT5H"` | no |
| <a name="input_reopen_closed_incidents"></a> [reopen\_closed\_incidents](#input\_reopen\_closed\_incidents) | Whether or not to re-open existing incidents when new alerts are triggered. When set to `true` incidents are re-opened and new alerts are associated to them. When set to `false` a new incident is created. | `bool` | `false` | no |
| <a name="input_severity"></a> [severity](#input\_severity) | The severity of the alert generated by this rule. One of `High`, `Medium`, `Low`, or `Informational`. | `string` | n/a | yes |
| <a name="input_suppression_duration"></a> [suppression\_duration](#input\_suppression\_duration) | When `suppression_enabled` is `true`, the amount of time the query should stop running after an alert is created, expressed as an ISO 8601 timespan. | `string` | `"PT5H"` | no |
| <a name="input_suppression_enabled"></a> [suppression\_enabled](#input\_suppression\_enabled) | Whether or not the rule should be prevented from running after an alert is generated. | `bool` | `false` | no |
| <a name="input_tactics"></a> [tactics](#input\_tactics) | A set of attack categories by which to classify the rule. Any of `Collection`, `CommandAndControl`, `CredentialAccess`, `DefenseEvasion`, `Discovery`, `Execution`, `Exfiltration`, `Impact`, `InitialAccess`, `LateralMovement`, `Persistence`, and `PrivilegeEscalation`. | `set(string)` | n/a | yes |
| <a name="input_techniques"></a> [techniques](#input\_techniques) | A set of attack techniques that represent 'how' an adversary achieves a tactical goal by performing an action. | `set(string)` | n/a | yes |
| <a name="input_trigger_operator"></a> [trigger\_operator](#input\_trigger\_operator) | The alert trigger operator applied to `trigger_threshold`. One of `Equal`, `GreaterThan`, `LessThan`, `NotEqual`. | `string` | `"GreaterThan"` | no |
| <a name="input_trigger_threshold"></a> [trigger\_threshold](#input\_trigger\_threshold) | The threshold of query results returned, compared by `trigger_operator`, that would cause this rule to trigger an alert. | `string` | `"0"` | no |
| <a name="input_workload_name"></a> [workload\_name](#input\_workload\_name) | Name of the workload. This will be used to name the resources deployed by this module. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->