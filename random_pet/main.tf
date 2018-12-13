resource "random_pet" "name" {
  length    = "4"
  separator = "-"
}

output "pet_module" {
  value = "${random_pet.name.id}"
}
