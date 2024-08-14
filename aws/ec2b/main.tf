resource "aws_instance" "webserverB" {        
	ami = "ami-0ad21ae1d0696ad58"
        instance_type = "t2.micro"
        tags = {
           Name = "WebserverB"
           Description = "An Ubuntu Machine for state lock checking"
       }
        key_name = "web"
        vpc_security_group_ids = [ aws_security_group.ssh-accessB.id ]

}

resource "aws_security_group" "ssh-accessB" {
        name = "ssh-accessB"
        description = "Allow SSH form internet"
        ingress {
            from_port = 22
            to_port   = 22
            protocol  = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
}

output publicip2 {
        value = aws_instance.webserverB.public_ip
}

terraform {
        backend "s3" {
           bucket         = "terraform-state-file-raj"
           key            = "Ec2StateFiles/terraform.tfstate"
           region         = "ap-south-1"
           dynamodb_table = "dynamodb-state-lock"
        }
}
