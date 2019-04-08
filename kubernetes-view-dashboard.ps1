. "$PSScriptRoot\0-variables.ps1"

Write-Host $date "Opening Dashboard" -ForegroundColor Green
az aks browse --resource-group $azureResoureGroupName  --name $azureKubernetesClusterName