resource "aws_instance" "webserver" {
        ami = "ami-0ad21ae1d0696ad58"
        instance_type = "t2.micro"
        tags = {
           Name = "Webserver"
           Description = "An Ubuntu Machine"
        }
        key_name = "web"
        vpc_security_group_ids = [ aws_security_group.ssh-access.id ]

}

resource "aws_security_group" "ssh-access" {
        name = "ssh-access"
        description = "Allow SSH form internet"
        ingress {
            from_port = 22
            to_port   = 22
            protocol  = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
}

output publicip {
        value = aws_instance.webserver.public_ip
}
