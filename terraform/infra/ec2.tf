resource "aws_key_pair" "deployer" {
    key_name = "${var.env}-terra-key"
    public_key = file("shamel-terra-key.pub")
}

resource "aws_default_vpc" "default" {
}

resource "aws_security_group" "allow_ssh" {
    name = "${var.env}-sg"
    description = "Allow SSH access"
    vpc_id = aws_default_vpc.default.id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "${var.env}-sg"
        environment = var.env
    }
}

resource "aws_instance" "my_instance" {
    count = var.instance_count
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = aws_key_pair.deployer.key_name
    security_groups = [aws_security_group.allow_ssh.name]
    tags = {
        Name = "${var.env}-instance"
        environment = var.env
    }

    root_block_device {
        volume_size = var.volume_size
        volume_type = "gp2"
    }
}
