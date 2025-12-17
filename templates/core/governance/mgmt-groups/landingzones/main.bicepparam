using './main.bicep'

// General Parameters
param parLocations = [
  'swedencentral'
  'uksouth'
]
param parEnableTelemetry = true

param landingZonesConfig = {
  createOrUpdateManagementGroup: true
  managementGroupName: 'jstalz-landingzones'
  managementGroupParentId: 'jstalz-alz'
  managementGroupIntermediateRootName: 'jstalz-alz'
  managementGroupDisplayName: 'Landing zones'
  managementGroupDoNotEnforcePolicyAssignments: []
  managementGroupExcludedPolicyAssignments: []
  customerRbacRoleDefs: []
  customerRbacRoleAssignments: []
  customerPolicyDefs: []
  customerPolicySetDefs: []
  customerPolicyAssignments: []
  subscriptionsToPlaceInManagementGroup: []
  waitForConsistencyCounterBeforeCustomPolicyDefinitions: 10
  waitForConsistencyCounterBeforeCustomPolicySetDefinitions: 10
  waitForConsistencyCounterBeforeCustomRoleDefinitions: 10
  waitForConsistencyCounterBeforePolicyAssignments: 40
  waitForConsistencyCounterBeforeRoleAssignments: 40
  waitForConsistencyCounterBeforeSubPlacement: 10
}

// Only specify the parameters you want to override - others will use defaults from JSON files
param parPolicyAssignmentParameterOverrides = {
  'Enable-DDoS-VNET': {
    parameters: {
    ddosPlan: {
      value: '/subscriptions/72b6d3e4-033c-49d3-b97d-8d9f62cb786b/resourceGroups/rg-alz-conn-${parLocations[0]}/providers/Microsoft.Network/ddosProtectionPlans/ddos-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-AzSqlDb-Auditing': {
    parameters: {
    logAnalyticsWorkspaceId: {
      value: '/subscriptions/6e602ee2-5c43-4ece-9535-257e95d1f43d/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.OperationalInsights/workspaces/log-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-vmArc-ChangeTrack': {
    parameters: {
    dcrResourceId: {
      value: '/subscriptions/6e602ee2-5c43-4ece-9535-257e95d1f43d/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-alz-changetracking-${parLocations[0]}'
      }
    }
  }
  'Deploy-VM-ChangeTrack': {
    parameters: {
    dcrResourceId: {
      value: '/subscriptions/6e602ee2-5c43-4ece-9535-257e95d1f43d/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-alz-changetracking-${parLocations[0]}'
    }
    userAssignedIdentityResourceId: {
      value: '/subscriptions/6e602ee2-5c43-4ece-9535-257e95d1f43d/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/uami-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-VMSS-ChangeTrack': {
    parameters: {
    dcrResourceId: {
      value: '/subscriptions/6e602ee2-5c43-4ece-9535-257e95d1f43d/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-alz-changetracking-${parLocations[0]}'
    }
    userAssignedIdentityResourceId: {
      value: '/subscriptions/6e602ee2-5c43-4ece-9535-257e95d1f43d/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/uami-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-vmHybr-Monitoring': {
    parameters: {
    dcrResourceId: {
      value: '/subscriptions/6e602ee2-5c43-4ece-9535-257e95d1f43d/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-alz-vminsights-${parLocations[0]}'
      }
    }
  }
  'Deploy-VM-Monitoring': {
    parameters: {
    dcrResourceId: {
      value: '/subscriptions/6e602ee2-5c43-4ece-9535-257e95d1f43d/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-alz-vminsights-${parLocations[0]}'
    }
    userAssignedIdentityResourceId: {
      value: '/subscriptions/6e602ee2-5c43-4ece-9535-257e95d1f43d/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/uami-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-VMSS-Monitoring': {
    parameters: {
    dcrResourceId: {
      value: '/subscriptions/6e602ee2-5c43-4ece-9535-257e95d1f43d/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-alz-vminsights-${parLocations[0]}'
    }
    userAssignedIdentityResourceId: {
      value: '/subscriptions/6e602ee2-5c43-4ece-9535-257e95d1f43d/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/uami-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-MDFC-DefSQL-AMA': {
    parameters: {
    userWorkspaceResourceId: {
      value: '/subscriptions/6e602ee2-5c43-4ece-9535-257e95d1f43d/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.OperationalInsights/workspaces/log-alz-${parLocations[0]}'
    }
    dcrResourceId: {
      value: '/subscriptions/6e602ee2-5c43-4ece-9535-257e95d1f43d/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-alz-mdfcsql-${parLocations[0]}'
    }
    userAssignedIdentityResourceId: {
      value: '/subscriptions/6e602ee2-5c43-4ece-9535-257e95d1f43d/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/uami-alz-${parLocations[0]}'
      }
    }
  }
}
