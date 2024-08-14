resource "aws_instance" "import_exampleB" {
        ami = "ami-0ad21ae1d0696ad58"
        instance_type = "t2.micro"
        tags = {
           Name = "import_exampleB"
           Description = "An Ubuntu Machine for import_exampleB"
       }
        key_name = "web"
        vpc_security_group_ids = [ aws_security_group.ssh-import_exampleB.id ]

}

resource "aws_security_group" "ssh-import_exampleB" {
        name = "ssh-import_exampleB"
        description = "Allow SSH form internet"
        ingress {
            from_port = 22
            to_port   = 22
            protocol  = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
}

output publicip2 {
        value = aws_instance.import_exampleB.public_ip
}

resource "aws_instance" "import_exampleA"{
	# (resource arguments)
	ami = "ami-0ad21ae1d0696ad58"
        instance_type = "t2.micro"
        tags = {
           Name = "import_exampleA"
           Description = "An Ubuntu Machine for import_exampleA"
       }
        key_name = "web"
        vpc_security_group_ids = [ aws_security_group.ssh-import_exampleA.id ]
}


resource "aws_security_group" "ssh-import_exampleA" {
        name = "ssh-import_exampleA"
        description = "Allow SSH form internet"
        ingress {
            from_port = 22
            to_port   = 22
            protocol  = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
}
