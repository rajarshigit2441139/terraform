variable region {
	default = "ap-south-1"
}

variable instance_type {
	default = "t2.micro"
}

variable ami {
	type = map
	default = {
		"ProjectA" = "ami-0ad21ae1d0696ad58" 
		"ProjectB" = "ami-0a4408457f9a03be3"
	}
}

