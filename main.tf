provider "aws" {
  region = "ap-south-1"  # Specify the Mumbai region
}

# Create an EC2 instance
resource "aws_instance" "web" {
  ami           = "ami-0dee22c13ea7a9a67"  # Use the latest Ubuntu AMI ID
  instance_type = "t2.micro"              # Instance type
  tags = {
    Name = "Mumbai-linux-EC2-Instance"  # Tag the instance
  }
  vpc_security_group_ids = ["sg-05cd9bab43a70250e"]
  key_name = "keypairbylearnjan"
  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install docker.io -y
              sudo usermod -a -G docker ubuntu
              sudo docker run -d -p 8010:8080 akshay0909/blogapp:latest
              EOF
}

#output
output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.web.id
}

output "instance_public_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.web.public_ip
}

#backend
terraform {
  backend "s3" {
    bucket         = "samplebuckt00" 
    key            = "terraform.tfstate" 
    region         = "ap-south-1" 
    encrypt        = true
    dynamodb_table = "terraform-lock-table" 
  }
}
