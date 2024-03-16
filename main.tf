resource "aws_iam_user" "lb" {
    count = length(var.name)
  name = var.name[count.index]
 

  tags = {
    created_by = "Terraform"
    iac = false
  }
}
