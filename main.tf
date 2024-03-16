resource "aws_iam_user" "lb" {
    count = length(var.name)
  name = var.name[count.index]
 

  tags = {
    created_by = "Terraform"
    iac = false
  }
}

resource "aws_instance" "this" {
  ami           = var.ami
  instance_type = var.instance_type 
  metadata_options {
    http_tokens = "required" //if http_tokens is omitted tfsec will failed the code
  }
  tags = {
    Name = var.tag_name
  }
}