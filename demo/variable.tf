variable "prefix" {
	description = "The prefix to be set" # optional
}

variable "separator" {
}

variable "length" {
}

variable "content" {
	default = [ "I love my cat", "I love my pet"]
	type = list  # optional
}


