. "$PSScriptRoot\0-variables.ps1"

# set kubectl context to the AKS cluster
az aks get-credentials --resource-group $azureResoureGroupName --name $azureKubernetesClusterName


# create namespace first
Write-Host $date "Creating Kubernetes Namespace" -ForegroundColor Green
kubectl create namespace $azureKubernetesNamespace

# apply manifest files in the namespace
Write-Host $date "Apply manifest files" -ForegroundColor Green
kubectl apply -f kubernetes-manifest.yaml --namespace=$azureKubernetesNamespace