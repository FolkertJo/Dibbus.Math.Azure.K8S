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
$azureKubernetesNamespace = $json.kubernetes.namespace
$azureKubernetesAppName = $json.kubernetes.application.name

# Container Registry
$azureContainerRegisteryName = $json.containerregistry.name
$azureContainerEndpointSuffix = $json.containerregistry.suffix
$azureContainerRegisteryEndpoint = "${azureContainerRegisteryName}.${azureContainerEndpointSuffix}".toLower()

$date = GetDateTime

function GetDateTime(){
   $date = "{0:f}" -f (get-date)
   return "$date >"
}