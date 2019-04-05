. "$PSScriptRoot\0-variables.ps1"

# set kubectl context to the AKS cluster
az aks get-credentials --resource-group $azureResoureGroupName --name $azureKubernetesClusterName

# create namespace first
kubectl create namespace $azureKubernetesNamespace

# apply manifest files in the namespace
kubectl apply -f kubernetes-manifest.yaml --namespace=$azureKubernetesNamespace