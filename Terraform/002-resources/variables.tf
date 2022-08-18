# Variable is a type of component
variable "secret_key" {
  default = "UEFEU9393FE490F330-FG3404030"
  # sensitive = true means Terraform won't output the value of this variable 
  sensitive = true
}
