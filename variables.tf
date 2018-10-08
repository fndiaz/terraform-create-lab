variable "access_key" {
	description = "AWS access key"
	default = ""
}

variable "secret_key" {
	description = "AWS secret key"
	default = ""
}

variable "region" {
	description = "AWS region for hosting our your network"
	default = ""
}

variable "key_path" {
	description = "Key path for SSHing into EC2"
	default  = "ssh/lab-kp1.pem"
}

variable "key_name" {
	description = "Key name for SSHing into EC2"
	default = "lab-kp1"
}

variable "vpc_cidr" {
	description = "CIDR for VPC"
	default     = "10.0.0.0/16"
}

variable "azs" {
    default = {
        "us-west-1" 	= "us-west-1a,us-west-1b"
        "us-west-2" 	= "us-west-2a,us-west-2b,us-west-2c"
        "us-east-1" 	= "us-east-1a,us-east-1b,us-east-1c"
        "us-east-2" 	= "us-east-2a,us-east-2b,us-east-2c"
        "sa-east-1" 	= "sa-east-1a,sa-east-1c"
        "ca-central-1" 	= "ca-central-1a,ca-central-1b"
        "ap-south-1"	= "ap-south-1a,ap-south-1b"
        "ap-northeast-1"= "ap-northeast-1a,ap-northeast-1c"
        "ap-northeast-2"= "ap-northeast-2a,ap-northeast-2"
        "ap-southeast-1"= "ap-southeast-1a,ap-southeast-1b,ap-southeast-1c"
        "eu-west-1"		= "eu-west-1a,eu-west-1b,eu-west-1c"
        "eu-west-2"		= "eu-west-2a,eu-west-2b,eu-west-2c"
        "eu-west-3"		= "eu-west-3a,eu-west-3b,eu-west-3c"
    }
}

variable "cidr_private" {
        default  = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
}

variable "cidr_public" {
        default  = ["10.0.11.0/24","10.0.12.0/24","10.0.13.0/24"]
}

variable "ami-ubuntu" {
	description = "Base AMI to launch the instances"
	default = {
	us-west-1 		= "ami-0ad16744583f21877"
	us-west-2 		= "ami-0e32ec5bc225539f5"
	us-east-1 		= "ami-059eeca93cf09eebd"
	us-east-2 		= "ami-0782e9ee97725263d"
	sa-east-1 		= "ami-0318cb6e2f90d688b"
	ca-central-1 	= "ami-0f2cb2729acf8f494"
	ap-south-1		= "ami-04ea996e7a3e7ad6b"
	ap-northeast-1  = "ami-06c43a7df16e8213c"
	ap-northeast-2	= "ami-0e0f4ff1154834540"
	ap-southeast-1  = "ami-0eb1f21bbd66347fe"
	eu-west-1  		= "ami-0773391ae604c49a4"
	eu-west-2		= "ami-061a2d878e5754b62"
	eu-west-3		= "ami-075b44448d2276521"
	}
}

variable "ami-amzlinux" {
	description = "Base AMI to launch the instances"
	default = {
	us-west-1 		= "ami-0bdb828fd58c52235"
	us-west-2 		= "ami-a0cfeed8"
	us-east-1 		= "ami-0ff8a91507f77f867"
	us-east-2 		= "ami-0b59bfac6be064b78"
	sa-east-1 		= "ami-07b14488da8ea02a0"
	ca-central-1 	= "ami-0b18956f"
	ap-south-1 		= "ami-0912f71e06545ad88"
	ap-northeast-1	= "ami-06cd52961ce9f0d85"
	ap-northeast-2  = "ami-0a10b2721688ce9d2"
	ap-southeast-1  = "ami-08569b978cc4dfa10"
	eu-west-1  		= "ami-047bb4163c506cd98"
	eu-west-2		= "ami-f976839e"
	eu-west-3		= "ami-0ebc281c20e89ba4b"
	}
}

variable "alb_name" {
	default = "lab-alb"
}

variable "alb_sg" {
	default = ["sg-alb", "sg-server-lab"]
} 

variable "alb_listener_port" {
	default = "80"
}

variable "alb_listener_protocol" {
	default = "HTTP"
}

variable "target_group_name" {
	default = "lab-alb-tg"
}

variable "target_group_path" {
	default = "/"
}