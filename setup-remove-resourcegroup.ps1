. "$PSScriptRoot\0-variables.ps1"

try {
   Write-Host $date "Remvoving resourcegroup; $azureResoureGroupName" -ForegroundColor Red
   az group delete -n $azureResoureGroupName -yes
   Write-Host $date "Resourcegroup; $azureResoureGroupName removed" -ForegroundColor Red
}
catch {
   $ErrorMessage = $_.Exception.Message
   Write-Output $ErrorMessage
}
