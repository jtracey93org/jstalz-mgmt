using './main-rbac.bicep'

param parLandingZonesManagementGroupName = 'jstalz-landingzones'
param parPlatformManagementGroupName = 'jstalz-platform'
param parConnectivityManagementGroupName = 'jstalz-connectivity'
param parManagementGroupExcludedPolicyAssignments = []
param parEnableTelemetry = true
