resource "aws_security_group" "allow_tls" {
  name        = "${var.project_name}-${var.environment}-${var.sg_name}"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id

dynamic egress {
    for_each = var.outbound_rules
    content {  
    from_port        = egress.value["from_port"]
    to_port          = egress.value["to_port"]
    protocol         = egress.value["protocol"]
    cidr_blocks      = egress.value["cidr_blocks"]
    }
  }

  dynamic ingress {
    for_each = var.inbound_rules
    content {  
    from_port        = ingress.value["from_port"]
    to_port          = ingress.value["to_port"]
    protocol         = ingress.value["protocol"]
    cidr_blocks      = ingress.value["cidr_blocks"]
    }
  }

  tags =merge(
    var.comman_tags,
    {
    Name = "${var.project_name}-${var.environment}-${var.sg_name}"
    }
  )
}