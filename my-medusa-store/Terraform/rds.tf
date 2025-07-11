resource "aws_db_subnet_group" "subnet_group" {
  name       = "medusa-db-subnet-group-v2"  # Changed to a unique name
  subnet_ids = module.vpc.private_subnets

  tags = {
    Name = "medusa-db-subnet-group-v2"
  }
}
