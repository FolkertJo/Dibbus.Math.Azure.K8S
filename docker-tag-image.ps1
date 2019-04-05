. "$PSScriptRoot\0-variables.ps1"

docker tag ${dockerImage}:${dockerTag} ${azureContainerRegisteryEndpoint}/${dockerImage}:${dockerTag}