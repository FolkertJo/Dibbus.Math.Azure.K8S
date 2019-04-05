. "$PSScriptRoot\0-variables.ps1"

# login to acr
az acr login --name megamathcontainerregistry

docker push ${azureContainerRegisteryEndpoint}`/${dockerImage}:${dockerTag}