. "$PSScriptRoot\0-variables.ps1"

Write-Host $date "Tag Docker image"
docker tag ${dockerImage}:${dockerTag} ${azureContainerRegisteryEndpoint}/${dockerImage}:${dockerTag}