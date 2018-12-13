#  This repo containt an example how to move Terraform random_pet resource

- clone the repo
```
git clone https://github.com/chavo1/move-state-module.git
cd move-state-module
```
- Initialise the provider and apply
```
terraform init
terraform apply
```
  - Update code to use the module with following:
```
module "main" {
  source = "./random_pet"
}

resource "null_resource" "hello" {
  provisioner "local-exec" {
    command = "echo Hello ${module.main.pet_module}"
  }
}

```
- Rename the resource:
```
terraform state mv random_pet.name module.main.random_pet.name
```
- Initialise the provider and apply again.
```
terraform init
terraform apply
```
- There should not be changes - the result should be similar to following:
```
$ terraform apply
random_pet.name: Refreshing state... (ID: externally-gladly-noted-cockatoo)
null_resource.hello: Refreshing state... (ID: 4026205498143543256)

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
```
