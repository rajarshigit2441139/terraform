terraform {
	backend "s3" {
	   bucket = "terraform-state-file-raj"
	   key	  = "StateFiles/terraform.tfstate"
	   region = "ap-south-1"
	}
}

