# creating azure resources
# . "$PSScriptRoot\azure-create-resourcegroup.ps1"
# . "$PSScriptRoot\azure-create-kubernetes-cluster.ps1"
# . "$PSScriptRoot\azure-create-container-registry.ps1"
# . "$PSScriptRoot\azure-set-permissions.ps1"

# docker tagging and pushing
. "$PSScriptRoot\docker-tag-image.ps1"
. "$PSScriptRoot\docker-push-image.ps1"

# transform manifest to match settings
. "$PSScriptRoot\kubernetes-manifest-transform.ps1"

# apply deployment and service manifests
. "$PSScriptRoot\kubernetes-apply-manifest.ps1"