# Single node deployment

## Pre-requisites

- Create a kind cluster: `kind create cluster`
- Create a `confluent` namespace: `kubectl create ns confluent`
- Install operator: `make helm-cfk-install-default`

## Run

Apply customization:

```
kustomize build deployment/single-node/ | k apply -f -
```

Port-forward Control Center:

```
kubectl port-forward svc/controlcenter :9021
```
