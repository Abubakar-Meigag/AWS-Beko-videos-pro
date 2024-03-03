terraform {
  required_providers {
    aws = {                                    
      source  = "hashicorp/aws"                
                        
    }
  }
  required_version = ">= 1.0.0"                
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "beko-SG-group" {
  name        = "farm_city_security_group"
  description = "Allow ports 22, 8080, and 5002"

 
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

 
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port   = 5002
    to_port     = 5002
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_instance" "beko-ec2-serves" {
  instance_type          = "t2.micro"
  ami                    = "ami-0a3c3a20c09d6f377"
  vpc_security_group_ids = ["sg-0546c27f8263d9160"]
  key_name               = "node-experss-ec2" 


  tags = {
    Name = "beko-ec2_serves"
  }

  provisioner "remote" {
    connection {
      type        = "ssh"
      user        = "ec2-user"  
      private_key = file("/Users/bekomeigag/Desktop/ec2-key/node-experss-ec2.pem")
      host        = self.public_ip
    }
inline = [
      "sudo yum update -y",
      "sudo yum install docker -y",
      "sudo systemctl start docker",
      "sudo systemctl enable docker"
    ]
} 
}