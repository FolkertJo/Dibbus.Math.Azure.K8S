. "$PSScriptRoot\0-variables.ps1"

Write-Host $date "Transforming manifest template" -ForegroundColor Green

$file = "$PSScriptRoot\kubernetes-manifest-template.yaml"
$fileTransformed = "$PSScriptRoot\kubernetes-manifest.yaml"

(Get-Content $file) | ForEach-Object {
    $_.replace("[docker-tag]", "$dockerTag").
    replace("[docker-image]", $dockerImage).
    replace("[k8s-endpoint]", "$azureContainerRegisteryEndpoint").
    replace("[k8s-application-name]", "$azureKubernetesAppName")
} | Out-File $fileTransformed