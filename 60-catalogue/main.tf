resource "aws_instance" "catalogue" {
  ami           = local.ami_id
  instance_type = "t3.micro"
  subnet_id = local.private_subnet_id
  vpc_security_group_ids = [local.catalogue_sg_id]

  
  tags = merge(
    {
        Name = "${var.project}-${var.environment}-catalogue"
    },
    local.common_tags
  )


}


resource "terraform_data" "catalogue" {
  # The 'triggers_replace' argument causes this resource to be replaced
  # (and thus its provisioners to run again) if the instance Id changes.
  triggers_replace = [aws_instance.catalogue.id]
  
   connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = aws_instance.catalogue.private_ip
  }
   
   provisioner "file" {
    source      = "bootstrap.sh" # Local file path
    destination = "/tmp/bootstrap.sh"    # Destination path on the remote machine
  }

  # Connection block is required to define how to connect to the remote host.
  provisioner "remote-exec" {
    
    # Commands to be executed on the remote instance
    inline = [
        "chmod +x /tmp/bootstrap.sh",
        "sudo /tmp/bootstrap.sh catalogue ${var.environment}"
    ]
  }
}


