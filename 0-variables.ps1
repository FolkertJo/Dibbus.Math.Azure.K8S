# Read settings
$json = Get-Content -Raw -Path "$PSScriptRoot\settings.json" | ConvertFrom-Json

# Generic
$azureLocation = $json.resourceGroup.location
$azureResoureGroupName = $json.resourceGroup.name
$dockerImage = $json.docker.image
$dockerTag = $json.docker.tag

# Kubernetes
$azureKubernetesClusterName = $json.kubernetes.clusterName
$azureKubernetesVmSize = $json.kubernetes.vmSize
$azureKubernetesNodeCount = $json.kubernetes.nodeCount

# Container Registry
$azureContainerRegisteryName = $json.containerregistry.name
$azureContainerEndpointSuffix = $json.containerregistry.endpointSuffix
$azureContainerRegisteryEndpoint = "${azureContainerRegisteryName}.${azureContainerEndpointSuffix}".toLower()