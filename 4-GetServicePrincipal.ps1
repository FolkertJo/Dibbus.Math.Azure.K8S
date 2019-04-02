. "$PSScriptRoot\0-variables.ps1"

try {
   Write-Host "Settings permissions in ACR so AKS has the correct permission to pull images from the registry" -ForegroundColor Yellow

   Write-Host "Getting assignee (AKS)" -ForegroundColor Yellow
   $appId = az aks list --resource-group $azureResoureGroupName --query "[0].servicePrincipalProfile.clientId" --output tsv
   Write-Host "Service Principal ClientID: $appId" -ForegroundColor Yellow

   Write-Host "Getting scope" -ForegroundColor Yellow
   $acrId = az acr show --resource-group $azureResoureGroupName --name $azureContainerRegisteryName --query "id" --output tsv
   Write-Host "Container Registry Resource ID: $acrId" -ForegroundColor Yellow

   # Set permissions on registry so the cluster can pull from this registry
   Write-Host "Assign role on the registry" -ForegroundColor Yellow
   az role assignment create --assignee $appId --scope $acrId --role acrpull
}
catch {
   $ErrorMessage = $_.Exception.Message
   Write-Output $ErrorMessage
}