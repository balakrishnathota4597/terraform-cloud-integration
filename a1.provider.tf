
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
    null = {
      source = "hashicorp/null"
    }
    random = {
      source = "hashicorp/random"
    }
  }
 backend "azurerm" {
   resource_group_name = "terraform-storage-rg"
   storage_account_name = "terraformstate201212"
   container_name = "tfstatefiles"
   key = "project1.tfstate"
 }

}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
 subscription_id = var.subscription_id
 client_id = var.client_id
 client_secret = var.client_secret
 tenant_id = var.tenant_id

}
variable "subscription_id" {
  type = string
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "tenant_id" {
  type = string
}
