resource "aws_vpc" "vpc-1" {
   cidr_block = var.vpc_cidr 
   tags = {
             Name = "${var.vpc_name}" 
          } 
   assign_generated_ipv6_cidr_block = false
} 

resource "aws_internet_gateway" "igw" {
   tags = {
             Name = "${var.igw_name}"
          } 
   vpc_id = aws_vpc.vpc-1.id 
} 


resource "aws_subnet" "pbsub" {
  for_each = toset(var.public_subnet_cidrs)
  vpc_id   = aws_vpc.vpc-1.id
  cidr_block = each.value
  availability_zone = element(["us-east-1a", "us-east-1b"], index(var.public_subnet_cidrs, each.value))
  map_public_ip_on_launch = true
  tags = {
          Name = "${var.pubsub_name}-${each.key}" 
         } 
}

resource "aws_subnet" "prvsb" {
  for_each = toset(var.private_subnet_cidrs)
  vpc_id   = aws_vpc.vpc-1.id
  cidr_block = each.value
  availability_zone = element(["us-east-1a", "us-east-1b"], index(var.private_subnet_cidrs, each.value))
  tags = {
           Name = "${var.privsub_name}-${each.key}"
}
}
   

resource "aws_route_table" "proute" {
  vpc_id = aws_vpc.vpc-1.id
  route {
         cidr_block = "0.0.0.0/0" 
         gateway_id = aws_internet_gateway.igw.id 
} 
}

resource "aws_route_table_association" "public_ssssss" {
  for_each = aws_subnet.pbsub
  subnet_id = each.value.id
  route_table_id = aws_route_table.proute.id
}


