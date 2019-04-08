. "$PSScriptRoot\0-variables.ps1"

# login to acr
az acr login --name megamathcontainerregistry

Write-Host $date "Pusing Docker image to ACR"
docker push ${azureContainerRegisteryEndpoint}`/${dockerImage}:${dockerTag}