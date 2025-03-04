# How to run the project

## Terraform

First make sure to add the value for the subscription_id in variables.tf

Locate at path: Task2-IaC/IaC

- `terraform init`
- `az login`
- `az account set --subscription "<insert-subscription-id\>"`
- `terraform plan`
- `terraform apply`

## Docker

Locate at path: Task2-IaC/node-todo

- Usual command:
`docker build -t rcmmyacr.azurecr.io/node-todo:1 .`

- As I have apple chip:
`docker buildx build --platform linux/amd64 -t rcmmyacr.azurecr.io/node-todo:8 .`

- `az login`

- `az acr login --name rcmmyacr.azurecr.io`

- `docker push rcmmyacr.azurecr.io/node-todo:8`

## Helm

- `helm create node-todo`

## MongoDB (inside the pod)

- `mongosh`
- `show dbs`
- `use node-todo`
- `db.todos.insertOne({ name: "Sample Task", completed: false })`
- `show dbs`
