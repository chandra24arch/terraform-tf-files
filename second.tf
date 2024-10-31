variable "v1" {

  default = ""
  type    = string

}

variable "v2" {

  default = "this is var2 content"

}
resource "local_file" "f2" {

  filename = var.v1
  content  = var.v2

}

output "file_id" {

  value = local_file.f2.id

}
