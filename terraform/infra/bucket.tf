resource "aws_s3_bucket" "my_bucket" {
    bucket = "shamel-${var.env}-bucket"
    tags = {
        Name = "shamel-${var.env}-bucket"
        environment = var.env
    }
}