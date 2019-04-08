. "$PSScriptRoot\0-variables.ps1"

try {
   Write-Host $date "Creating Container Registry: $azureContainerRegisteryName" -ForegroundColor Green
   Write-Host $date "Resourcegroup: $azureResoureGroupName" -ForegroundColor Green

   az acr create `
   --resource-group $azureResoureGroupName `
   --name $azureContainerRegisteryName `
   --sku Basic
}
catch {
   $ErrorMessage = $_.Exception.Message
   Write-Output $ErrorMessage
}

