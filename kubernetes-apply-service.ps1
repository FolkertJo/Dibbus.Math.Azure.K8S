. "$PSScriptRoot\0-variables.ps1"

# set kubectl context to the AKS cluster
az aks get-credentials --resource-group $azureResoureGroupName --name $azureKubernetesClusterName

# apply manifest files
kubectl apply -f k8s-service.yaml --namespace=kube-megamath