provider "aws" {
  region = "us-east-1"  
}

# Use an existing VPC
data "aws_vpc" "existing" {
  id = "vpc-087693feeb524f78f"
}

# Use an existing subnet group
data "aws_db_subnet_group" "existing" {
  name = "vpc-087693feeb524f78f"
}

resource "aws_db_instance" "junita" {
  
  identifier            = "beko-aws-db"
  allocated_storage     = 20 
  engine                = "postgres"
  engine_version        = "15.5"
  instance_class        = "db.t3.micro"
  db_name               = "bekoDB"
  username              = "postgres"
  password              = "password"
  parameter_group_name  = "default.postgres15"
  publicly_accessible   = true
  vpc_security_group_ids = ["sg-0546c27f8263d9160"]  
 
}