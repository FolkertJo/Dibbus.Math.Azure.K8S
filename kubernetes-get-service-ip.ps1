. "$PSScriptRoot\0-variables.ps1"

try {
   Write-Host $date "Getting External IP Address" -ForegroundColor Green
   
   $serviceName = "svc-$azureKubernetesAppName"
   $json = kubectl get service $serviceName -n $azureKubernetesNamespace -ojson

   $jsonObject = $json | ConvertFrom-Json
   $ip = $jsonObject.status.loadBalancer.ingress[0].ip

   # View IP
   Write-Host $date "External IP Address: $ip"

   # Open browser
   Start-Process "http://$ip"
}
catch {
   $ErrorMessage = $_.Exception.Message
   Write-Output $ErrorMessage
}