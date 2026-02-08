resource "aws_security_group" "sgg" {
  name = "my-app-sg" 
  description = "security group for my app"
  vpc_id =  aws_vpc.vpc-1.id 
} 

resource "aws_security_group_rule" "ein" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sgg.id
}

resource "aws_security_group_rule" "einn" {
  type              = "egress" 
  from_port         = 0
  to_port           = 0
  protocol          = "-1" 
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sgg.id
}

