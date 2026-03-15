variable "project" {
    type = string
    default = "roboshop"
  
}

variable "environment" {
    type = string
    default = "dev"
  
}

variable "sg_names" {
    type = list(string)
    default = [
        # Database SGs
        "mongodb", "redis", "rabbitmq", "mysql", 

        # Backend SGs
        "cart", "catalogue", "user", "shipping", "payment",

        # Backend ALB SG"
        "backend_alb",
        
        # Frontend SGs
        "frontend", "frontend_alb",
        
        # bastion SG
        "bastion"

        ]
  
}