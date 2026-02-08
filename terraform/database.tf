resource "aws_db_subnet_group" "sgg" {
  name       = "${var.clusterN}-db-subnet"
  subnet_ids = values(aws_subnet.prvsb)[*].id
}

resource "aws_db_instance" "postgres" {
  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "14"
  instance_class       = "db.t3.micro"
  db_name                 = "htht"
  username             = var.db_username
  password             = var.db_password
  db_subnet_group_name = aws_db_subnet_group.sgg.name
  skip_final_snapshot  = true
  publicly_accessible  = false
  vpc_security_group_ids = [aws_security_group.sgg.id]
}
