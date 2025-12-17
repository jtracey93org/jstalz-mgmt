using './main.bicep'

// General Parameters
param parLocations = [
  'swedencentral'
  'uksouth'
]
param parEnableTelemetry = true

param platformSecurityConfig = {
  createOrUpdateManagementGroup: true
  managementGroupName: 'jstalz-security'
  managementGroupParentId: 'jstalz-platform'
  managementGroupIntermediateRootName: 'jstalz-alz'
  managementGroupDisplayName: 'Security'
  managementGroupDoNotEnforcePolicyAssignments: []
  managementGroupExcludedPolicyAssignments: []
  customerRbacRoleDefs: []
  customerRbacRoleAssignments: []
  customerPolicyDefs: []
  customerPolicySetDefs: []
  customerPolicyAssignments: []
  subscriptionsToPlaceInManagementGroup: ['6c38c3b6-2d58-4234-96b4-f80e7a58dabb']
  waitForConsistencyCounterBeforeCustomPolicyDefinitions: 30
  waitForConsistencyCounterBeforeCustomPolicySetDefinitions: 30
  waitForConsistencyCounterBeforeCustomRoleDefinitions: 30
  waitForConsistencyCounterBeforePolicyAssignments: 30
  waitForConsistencyCounterBeforeRoleAssignments: 30
  waitForConsistencyCounterBeforeSubPlacement: 30
}

// Only specify the parameters you want to override - others will use defaults from JSON files
param parPolicyAssignmentParameterOverrides = {
  // No policy assignments in platform-security currently
}
