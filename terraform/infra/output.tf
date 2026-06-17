output "ec2_public_ip" {
    value = aws_instance.my_instance[*].public_ip
    description = "The public IP address of the EC2 instances."
}