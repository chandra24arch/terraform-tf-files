provider "random" {}

# Define an input variable for the random string length

variable "string_length" {
  description = "Enter the length of the random string"
  type        = number
}


# Random string resource

resource "random_string" "randomtest" {
  length           = var.string_length
  special          = true
  override_special = "/@£$"
}

output "random_string_output" {
  value = random_string.randomtest.result
}

# Local file provider
provider "local" {}


# Create a file with the random string as its content

resource "local_file" "ramdom_file" {
  filename = "random_text_output.txt" 
  content  = random_string.randomtest.result
}

