module "vlog_webserver" {
	source ="/home/rajarshi/terraform/aws/module/child_mod" # Path of module
	web_region = "ap-south-1"
	ami = "ami-0ad21ae1d0696ad58"
}



