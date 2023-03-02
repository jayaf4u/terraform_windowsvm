variable "resource_group" {
    default = "Terraform-RG"
}
variable "location" {
    default = "southcentralus"
}
variable "tf_nsg" {
    default = "tfnsg"
}

variable "vnet_name" {
    default = "tf_vnet"
}
variable "vnet_address_space" {
    default = "192.168.0.0/16"
}
variable "tf_subnet_name" {
    default = "tf_subnet1"
}
variable "tf_subnet_address_space" {
    default = "192.168.0.0/26"
}

variable "tfvm_publicIp_Name" {
    default = "tfvm_pip"
}
variable "tfvm_nic_name" {
    default = "tfvmnic001"
}

variable "VM_Name" {
    default = "tfvm001"
}
variable "admin_user" {
    default = "azadmin"
}
variable "Vm_Size" {
    default = "Standard_B2ms"
}
variable "admin_password" {
    default = "PaaSword12345"
}
variable "vm_os_disk_size_in_GB" {
    default = 150
}
variable "image_publisher" {
    default = "MicrosoftWindowsServer"
}
variable "image_offer" {
    default = "WindowsServer"
}
variable "image_sku" {
    default = "2019-Datacenter"
}
variable "image_version" {
    default = "latest"
}
