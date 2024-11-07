variable "rg_name" {
  default = "tf_rg"
}

variable "location" {
  default = "CentralIndia"
}

variable "address_space" {
  default = ["10.0.0.0/16"]
  type    = list(string)
}

variable "vnet_name" {
  default = "tf_vnet"
}
variable "subnet_space" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
  type    = list(string)
}

variable "subnet_name" {
  default = "tf_subnet"
}


variable "winnic_name" {
  default = "winnic"
}
variable "public-ipwin_name" {
  default = "public-winip"
}

variable "ip_name" {
  default = "ip"
}
variable "sku" {
  default = "22.04-LTS"
}
variable "vm_name" {
  default = "windowstfvm"
}
variable "admin" {
  default = "azureadmin"
}
variable "size" {
  default = "Standard_B1s"
}
variable "user" {
  default = "azureuser"
}

variable "admin_password" {
  type        = string
  default     = "Windows@2024"
  sensitive = true
}


variable "nsg" {
  default = "nsgwin"
}

