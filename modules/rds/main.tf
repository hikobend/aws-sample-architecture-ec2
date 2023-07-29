module "db" {
  source = "terraform-aws-modules/rds/aws"

  identifier = "${env.dev}-db"

  engine            = "mysql"
  engine_version    = "5.7"
  instance_class    = "db.t2.micro"
  allocated_storage = 5

  db_name  = "${env.dev}-db"
  username = "user"
  port     = "3306"

  iam_database_authentication_enabled = true

  vpc_security_group_ids = [var.database_sg]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  monitoring_interval    = "30"
  monitoring_role_name   = "MyRDSMonitoringRole"
  create_monitoring_role = true

  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  create_db_subnet_group = true
  subnet_ids             = [var.private_subnet_1a_id, var.private_subnet_1c_id]
  family                 = "mysql5.7"
  major_engine_version   = "5.7"

  deletion_protection = true

  parameters = [
    {
      name  = "character_set_client"
      value = "utf8mb4"
    },
    {
      name  = "character_set_server"
      value = "utf8mb4"
    }
  ]
}
