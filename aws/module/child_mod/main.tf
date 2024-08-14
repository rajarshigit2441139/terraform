resource "aws_instance" "Webserver" {
	ami = var.ami
	instance_type = "t2.micro"
	tags = {
		Name = "${var.web_region}-webserber"
	}
}
