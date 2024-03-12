provider "aws" {
  region = "us-east-1"  
}

resource "aws_db_instance" "beko-db-aws" {
  
  identifier            = "beko-db-aws"
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
  skip_final_snapshot = true
  # final_snapshot_identifier = "beko-db-aws-snapshot"
}