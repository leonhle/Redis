# Configure the AWS provider
provider "aws" {
  region = var.region
}

# Create a Security Group for an EC2 instance 
resource "aws_security_group" "sg1" {
  name = "bts-redis"
  vpc_id = var.vpc_id
  ingress {
    from_port	  = "${var.server_port}"
    to_port	    = "${var.server_port}"
    protocol	  = var.protocol
    cidr_blocks	= var.cidr_range
  }
}


# Create an EC2 instance
resource "aws_instance" "instance1" {
  ami			                = var.ami_id
  instance_type           = var.instance_type
  vpc_security_group_ids  = ["${aws_security_group.sg1.id}"]
  subnet_id = var.subnet_id-zone_A
  key_name = var.key_pair
  iam_instance_profile = var.iam_instance_profile
  ebs_block_device {
    device_name = "/dev/xvda"
    volume_type = "gp3"
    volume_size = "30"
    delete_on_termination = "1"

  }

  metadata_options {
   http_tokens                 = "required"
   http_put_response_hop_limit = 1
  }

    user_data = <<-EOF
              #!/bin/bash
              sudo dnf install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
              EOF
			  
			  
  tags = {
    Name = "bts-redis-1"
  }
}

# Create an EC2 instance
resource "aws_instance" "instance2" {
  ami			                = var.ami_id
  instance_type           = var.instance_type
  vpc_security_group_ids  = ["${aws_security_group.sg1.id}"]
  key_name = var.key_pair
  subnet_id = var.subnet_id-zone_A
  iam_instance_profile = var.iam_instance_profile
  ebs_block_device {
    device_name = "/dev/xvda"
    volume_type = "gp3"
    volume_size = "30"
    delete_on_termination = "1"

  }
  metadata_options {
   http_tokens                 = "required"
   http_put_response_hop_limit = 1
  }

    user_data = <<-EOF
              #!/bin/bash
              sudo dnf install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
              EOF
			  
			  
  tags = {
    Name = "bts-redis-2"
  }
}

# Create an EC2 instance
resource "aws_instance" "instance3" {
  ami			                = var.ami_id
  instance_type           = var.instance_type
  vpc_security_group_ids  = ["${aws_security_group.sg1.id}"]
  key_name = var.key_pair
  subnet_id = var.subnet_id-zone_B
  iam_instance_profile = var.iam_instance_profile
    ebs_block_device {
    device_name = "/dev/xvda"
    volume_type = "gp3"
    volume_size = "30"
    delete_on_termination = "1"

  }
  metadata_options {
   http_tokens                 = "required"
   http_put_response_hop_limit = 1
  }

    user_data = <<-EOF
              #!/bin/bash
              sudo dnf install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
              EOF
			  
			  
  tags = {
    Name = "bts-redis-3"
  }
}
