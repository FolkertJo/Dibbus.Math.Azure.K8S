# Dibbus.Math.Azure.K8S

Scripted Docker image deployment in Azure Kubernets Services

Add a settings.json file using this format with the correct settings:

'''json
{
   "resourceGroup": {
      "location": "westeurope",
      "name": ""
   },
   "docker": {
      "imageName": "",
      "imageTag": "3.0.0"
   },
   "kubernetes": {
      "clusterName": "",
      "vmSize": "Standard_B2s",
      "nodeCount": "1"
   },
   "containerregistry": {
      "name":"",
      "endpointSuffix":"azurecr.io"
   }
}