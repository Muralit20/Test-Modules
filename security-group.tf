locals {
  ingress_rules = [
    {
      port        = 443
      description = "https port"
    },
    {
      port        = 80
      description = "http port"
    },
    {
      port        = 22
      description = "ssh port"
    }
  ]
}


resource "aws_security_group" "main" {
  name        = "${var.stage}-sg-01"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id
  egress = [
    {
      description      = "TLS from VPC"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      security_groups  = []
      prefix_list_ids  = []
      ipv6_cidr_blocks = []
      self             = false
    }
  ]

  dynamic "ingress" {
    for_each = local.ingress_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      cidr_blocks = ["0.0.0.0/0"]
      protocol    = "tcp"
    }
  }

  tags = {
    Name = "${var.stage}-sg-01"
  }
}