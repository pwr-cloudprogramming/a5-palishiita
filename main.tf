# terraform services
terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = ">= 5.0"
        }
    }
    required_version = ">= 1.2.0"
}

provider "aws" {
    region     = "us-east-1"
}

# VPC
resource "aws_vpc" "tic_tac_toe_vpc" {
    cidr_block           = "10.0.0.0/16"
    instance_tenancy     = "default"
    enable_dns_hostnames = "true"
    
    tags = {
        Name = "tic_tac_toe_vpc"
    }
}


#SECURITY GROUP
resource "aws_security_group" "tic_tac_toe_sg" {
    name        = "tic_tac_toe_sg"
    description = "This firewall allows SSH, HTTP and CUSTOM"
    vpc_id      = aws_vpc.tic_tac_toe_vpc.id

    ingress {
        description = "SSH"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "Frontend"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    ingress {
        description = "Backend"
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    tags = {
        Name = "tic_tac_toe_sg"
    }
    
}

#SUBNETS
resource "aws_subnet" "public" {
    vpc_id                  = aws_vpc.tic_tac_toe_vpc.id
    cidr_block              = "10.0.102.0/24"
    availability_zone       = "us-east-1a"
    map_public_ip_on_launch = "true"

    tags = {
        Name = "tic_tac_toe_my_public_subnet"
    }
}

resource "aws_subnet" "private" {
    vpc_id            = aws_vpc.tic_tac_toe_vpc.id
    cidr_block        = "10.0.103.0/24"
    availability_zone = "us-east-1b"

    tags = {
        Name = "tic_tac_toe_my_private_subnet"
    }
}

#GATEWAY
resource "aws_internet_gateway" "tic_tac_toe_gateway" {
    vpc_id = aws_vpc.tic_tac_toe_vpc.id
    
    tags = {
        Name = "tic_tac_toe_gateway"
    }
}

#ROUTING TABLE
resource "aws_route_table" "tic_tac_toe_rt" {
    vpc_id = aws_vpc.tic_tac_toe_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.tic_tac_toe_gateway.id
    }

    tags = {
        Name = "tic_tac_toe_rt"
    }
}

resource "aws_route_table_association" "a" {
    subnet_id      = aws_subnet.public.id
    route_table_id = aws_route_table.tic_tac_toe_rt.id
}

resource "aws_route_table_association" "b" {
    subnet_id      = aws_subnet.private.id
    route_table_id = aws_route_table.tic_tac_toe_rt.id
}


# INSTANCE
resource "aws_instance" "tic_tac_toe_instance" {
    ami                         = "ami-080e1f13689e07408"
    instance_type               = "t2.micro"
    key_name                    = "vockey"
    vpc_security_group_ids      = [aws_security_group.tic_tac_toe_sg.id]
    subnet_id                   = aws_subnet.public.id
    associate_public_ip_address = true

    user_data = file("build_and_run.sh")
    user_data_replace_on_change = true

    tags = {
        Name = "Tic-Tac-Toe-Game-Instance"
    }
}