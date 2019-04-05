# Dibbus.Math.Azure.K8S

Scripted Docker image deployment in Azure Kubernets Services

Add a settings.json file using this format with the correct settings:

> settings.json

```json
{
   "resourceGroup": {
      "location": "westeurope",
      "name": "[name of the Azure resource group]"
   },
   "docker": {
      "image": {
         "name": "[name of the docker image]",
         "tag": "[name of the docker tag]"
      }
   },
   "kubernetes": {
      "cluster": {
         "name": "[name of the kubernetes cluster]",
         "size": "Standard_B2s",
         "nodes": 1
      }
   },
   "containerregistry": {
      "name":"[name of the container registry]",
      "suffix":"azurecr.io"
   }
}