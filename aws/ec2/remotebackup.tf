terraform {
        backend "s3" {
           bucket 	  = "terraform-state-file-raj"
           key      	  = "Ec2StateFiles/terraform.tfstate"
           region         = "ap-south-1"
	   dynamodb_table = "dynamodb-state-lock"
        }
}
