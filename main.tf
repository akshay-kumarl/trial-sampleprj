provider "aws" {
  region = "ap-south-1"  # Specify the Mumbai region
}

# Create an EC2 instance
resource "aws_instance" "web" {
  ami           = "ami-08718895af4dfa033"  # Use the latest Ubuntu AMI ID
  instance_type = "t2.micro"              # Instance type
  tags = {
    Name = "Mumbai-linux-EC2-Instance"  # Tag the instance
  }
  vpc_security_group_ids = ["sg-05cd9bab43a70250e"]
  key_name = "keypairbylearnjan"
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
    key            = "samplebuckt00/terraform.tfstate" #terraform.tfstate is compulsory file 
    region         = "ap-south-1" 
    encrypt        = true
    dynamodb_table = "terraform-lock-table" 
  }
}
