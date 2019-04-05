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
```

## Kubernetes manifest files

The Kubernetes deployment requires additional manifest files which are responsible for designing the 'Desired State'.

To use a manifest file, create a file called 'kubernetes-apply-manifest.yaml'. Copy past this code in the file and use your own settings:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: [app name]
spec:
  replicas: 1
  template:
    metadata:
      labels:
        app: [app name]
    spec:
      containers:
        - image: "[Azure Container Registry name].azurecr.io/[Docker image name]:[Docker image Tag]"
          imagePullPolicy: Always
          name: [app name]
          ports:
          - containerPort: 80
---
apiVersion: v1
kind: Service
metadata:
  name: [service name]
spec:
  type: LoadBalancer
  ports:
  - port: 80
  selector:
    app: [app name]
```