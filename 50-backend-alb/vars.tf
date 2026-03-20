variable "environment" {
    description = "Environment name (e.g., dev, staging, prod)"
    type        = string
    default = "dev"
  
}

variable "project" {
    description = "Project name (e.g., roboshop)"
    type        = string
    default = "roboshop"
  
}

variable "zone_id" {
    description = "Route53 Hosted Zone ID"
    type        = string
    default = "Z0284894TI6GCPU6GNRN"
  
}

variable "domain_name" {
    description = "Domain name for Route53 records"
    type        = string
    default = "manig.online"
  
}