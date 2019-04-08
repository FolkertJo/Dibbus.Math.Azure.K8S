. "$PSScriptRoot\0-variables.ps1"

try {
   Write-Host $date "Creating Resourcegroup: $azureResoureGroupName in $azureLocation" -ForegroundColor Green

   az group create `
      --name $azureResoureGroupName `
      --location $azureLocation
}
catch {
   $ErrorMessage = $_.Exception.Message
   Write-Output $ErrorMessage
}