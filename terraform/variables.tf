variable "region" {
   type  = string
   default = "us-east-1"
}


variable "vpc_cidr" {
   default = "10.0.0.0/16"
}

variable "igw_name" {
   type = string
   default = "igw-vpc" 
}

variable "vpc_name" { 
   type = string 
   default = "vpc1"
}

variable "public_subnet_cidrs" {
 type = list(string) 
 default = ["10.0.1.0/24" , "10.0.2.0/24"] 
} 

variable "private_subnet_cidrs" {
  type = list(string)
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "pubsub_name" {
  type = string 
  default = "public-subnet"
} 

variable "privsub_name" {
  type = string
  default = "private-subnet"
}

variable "clusterN" {
  type = string 
  default = "huhhuh"
}

variable "db_username" {
  type = string 
  default = "htht" 
} 

variable "db_password" {
   type = string 
   default = "hthtljlj" 
}
