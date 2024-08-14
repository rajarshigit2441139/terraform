 resource "local_file" "pet" {
	filename = "/home/rajarshi/terraform/demo/pet.txt"
	content = "I love my pet"
	file_permission = "0700"
}


resource "local_file" "cat" {
	filename = "/home/rajarshi/terraform/demo/cat.txt"
	content = var.content[0]
	file_permission = "0700"
}


resource "random_pet" "my_pet" {
        prefix = var.prefix
        separator = var.separator
        length = var.length
}

resource "random_pet" "my_pet_output" {
        prefix = var.prefix
        separator = var.separator
        length = var.length
}

output "pate_name" {
	value = random_pet.my_pet_output.id
	description = "it will record my_pet_output's ID"
}
