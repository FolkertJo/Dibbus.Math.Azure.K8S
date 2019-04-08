. "$PSScriptRoot\0-variables.ps1"

try {
   Write-Host $date "Creating Kubernetes Cluster: $azureKubernetesClusterName in: $azureResoureGroupName in $azureLocation" -ForegroundColor Green
   Write-Host $date "Resourcegroup: $azureResoureGroupName" -ForegroundColor Green
   Write-Host $date "Location: $azureLocation" -ForegroundColor Green
   Write-Host $date "VM size: $azureKubernetesVmSize" -ForegroundColor Green
   Write-Host $date "Number of nodes: $azureKubernetesNodeCount" -ForegroundColor Green

   az aks create `
   --resource-group $azureResoureGroupName `
   --name $azureKubernetesClusterName `
   --node-vm-size $azureKubernetesVmSize `
   --node-count $azureKubernetesNodeCount  `
   --generate-ssh-keys
}
catch {
   $ErrorMessage = $_.Exception.Message
   Write-Output $ErrorMessage
}


