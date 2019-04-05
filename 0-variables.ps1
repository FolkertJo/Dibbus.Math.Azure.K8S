# Read settings
$json = Get-Content -Raw -Path "$PSScriptRoot\settings.json" | ConvertFrom-Json

# Generic
$azureLocation = $json.resourceGroup.location
$azureResoureGroupName = $json.resourceGroup.name
$dockerImage = $json.docker.image.name
$dockerTag = $json.docker.image.tag

# Kubernetes
$azureKubernetesClusterName = $json.kubernetes.cluster.name
$azureKubernetesVmSize = $json.kubernetes.cluster.size
$azureKubernetesNodeCount = $json.kubernetes.cluster.nodes

# Container Registry
$azureContainerRegisteryName = $json.containerregistry.name
$azureContainerEndpointSuffix = $json.containerregistry.endpointSuffix
$azureContainerRegisteryEndpoint = "${azureContainerRegisteryName}.${azureContainerEndpointSuffix}".toLower()