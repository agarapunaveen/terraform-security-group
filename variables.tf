variable "project_name" {
  
}

variable "environment" {
  
}

variable "vpc_id" {
  
}
variable "sg_name" {
  
}

variable "comman_tags" {
 
}
variable "outbound_rules" {
  default =[
     {
    from_port=0
    to_port=0
    protocol=-1
    cidr_blocks=["0.0.0.0/0"]
  }
  ]
}
variable "inbound_rules" {
  default = []
}