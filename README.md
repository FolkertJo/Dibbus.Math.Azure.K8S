# Dibbus.Math.Azure.K8S

Scripted Docker image deployment in Azure Kubernets Services

## Setup

In order to run a Docker image in Azure Kubernetes Services you'll need:

1. An Azure Resourcegroup
2. An Azure Kubernetes cluster
3. An Azure container registry
4. Kubernetes permissions to pull from the registry
5. A docker image (duh!)
6. A service manifest
7. A deployment manifest
8. A configmap (optional)

## Settings

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

## Start

You can run the [99-run-all.ps1](99-run-all.ps1) script to start the setup.

## Duration of this installation

This whoel setup, using a small Docker images takes around 10 minutes to setup. Most of the time is consumed by settings up the Kubernetes cluster:

```Log
15:54 > Creating Resourcegroup: [name of resourcegroup] in [location]
15:54 > Creating Kubernetes Cluster: [name of cluster] in: [name of resourcegroup] in [location]
15:54 > Resourcegroup: [name of resourcegroup]
15:54 > Location: [location]
15:54 > VM size: [vmsize]
15:54 > Number of nodes: [number of nodes]
16:01 > Creating Container Registry: [name of container registry]
16:01 > Resourcegroup: [name of resourcegroup]
16:02 > Settings permissions in ACR so AKS has the correct permission to pull images from the registry
16:02 > Getting assignee (AKS)
16:02 > Service Principal ClientID: [GUID]
16:02 > Getting scope
16:02 > Container Registry Resource ID: [full path of the container registry]
16:02 > Assign role on the registry
16:02 > Tag Docker image
16:02 > Pusing Docker image to ACR
16:04 > Transforming manifest template
16:04 > Creating Kubernetes Namespace
16:04 > Apply manifest files
16:04 > Opening Dashboard
```