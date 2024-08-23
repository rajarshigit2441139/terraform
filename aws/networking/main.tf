resource "aws_instance" "twotier-instance" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key
    vpc_security_group_ids = [ aws_security_group.ssh-access.id ]
    subnet_id            = aws_subnet.PublicSubnet.id
    tags = {
        Name = terraform.workspace
        Description = "An Ubuntu Machine for docker file"
    }
}

resource "aws_security_group" "ssh-access" {
        name = "ssh-access"
        description = "Allow SSH form internet"
        vpc_id      = aws_vpc.flasVPC.id
        ingress {
          from_port = 22
          to_port   = 22
          protocol  = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        }

            # Port 5000 ingress rule
        ingress {
          from_port   = 5000
          to_port     = 5000
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        }

        egress {
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        }
}



resource "null_resource" "write_outputs_to_file" {
  provisioner "local-exec" {
    command = <<EOT
      echo "Instance IP: ${aws_instance.twotier-instance.public_ip}" > terraform_outputs.txt
    EOT
  }

  # Ensure the null_resource only runs after the instance is created
  depends_on = [aws_instance.twotier-instance]
}

output "publicIP" {
  value = aws_instance.twotier-instance.public_ip 
}




# ssh -i "key_name" ubuntu@PublicIP
