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
      },
      "namespace": "[preferred namespace]]",
      "application": {
         "name" :"[name of yout application]"
      }
   },
   "containerregistry": {
      "name":"[name of the container registry]",
      "suffix":"azurecr.io"
   }
}
```

## Kubernetes manifest files

The Kubernetes deployment requires additional manifest files which are responsible for designing the 'Desired State'.

This repo contains a [simple transform script](kubernetes-manifest-transform.ps1) to find/replace the values from the settings file. This scripts takes the [template file](kubernetes-manifest-template.yaml) file and injects the values from the settings.json. The result is renamed to 'kubernetes-manifest.yaml' which is referenced in the [deployment script](kubernetes-apply-manifest.ps1).