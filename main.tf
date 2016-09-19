#
# DO NOT DELETE THESE LINES!
#
# Your subnet ID is:
#
#     subnet-097d9235
#
# Your security group ID is:
#
#     sg-74a4d00e
#
# Your AMI ID is:
#
#     ami-db24d8b6
#
# Your Identity is:
#
#     velocity-d3d9446802a44259755d38e6d163e820
#


provider "aws" {
  access_key = "AKIAJ4JMPX7W5M7JOSXA"
  secret_key = "/BUbOfLHS1nBiLv20XnJjOhvh7nuqYBBUl3ael7y"
  region     = "us-east-1"
}





resource "aws_instance" "web" {
  count = 2
  ami= "ami-db24d8b6"
  instance_type= "t2.micro"

subnet_id = "subnet-097d9235"
vpc_security_group_ids = ["sg-74a4d00e"]

tags {
    Identity = "velocity-d3d9446802a44259755d38e6d163e820"
   }
}

output "public_ip" {
 value = ["${aws_instance.web.*.public_ip}"]
}




