terraform {
  /*
    Block that contains configurations specific for the
    Terraform service, as well as the infrastructure provider
  */
  required_providers {
    oci = {                 # Alias for internal reference
      source = "oracle/oci" # Hostname from the Terraform registry https://registry.terraform.io/
      version = "5.14.0 "   # I highly recommend you speficy it (lock it) 
                            # https://developer.hashicorp.com/terraform/tutorials/configuration-language/provider-versioning
    }
  }
}

provider "oci" {
  /*
    This block configures a specific provider based on the alias defined
    in the terraform block
    On the background, it uses a plugin specific to each provider
    so that Terraform can manage the resources
    This is downloaded at the .terraform/ 
    Check the `provider.tf` file for alternate methods of authentification
  */
  region              = var.region
  auth                = "SecurityToken"
  config_file_profile = "learn-terraform" # Token credentials stored locally
}

## The following blocks are resource blocks, different from the 
#  provider and terraform block.
/*
    Manages the actual instances.
    Also referenced as resources in OCI.
    As you can see we now define two things at the "resource level"
      resourceType = "oci_core_vcn"
      resourceName = "internal"
      * This creates an ID to identify the resources withing script as:
        resourceType.resourceName
    All the other parameters are defined by the infrastructure provider.
    In the case for Oracle, check: https://registry.terraform.io/providers/oracle/oci/latest
  */

# Create a VCN
resource "oci_core_vcn" "internal" {
  
  dns_label      = "internal"
  cidr_block    = "172.16.0.0/20"
  compartment_id = var.compartment_id
  display_name   = "My VCN"
}

# Create a private subnet
resource "oci_core_subnet" "privateSubnet" {
  # Required
  vcn_id         = oci_core_vcn.internal.id
  cidr_block     = "172.16.0.0/24"
  compartment_id = var.compartment_id
  # Optional
  display_name               = "privateSubnet 1"
  prohibit_public_ip_on_vnic = true
  dns_label                  = "privateSubnet"
}

# Create a public subnet
resource "oci_core_subnet" "publicSubnet" {
  vcn_id = oci_core_vcn.internal.id
  # NOTE: The cidr_block cannot be shared with other subnets. 
  cidr_block     = "172.16.1.0/24"
  compartment_id = var.compartment_id

  display_name = "publicSubnet 1"
  # This makes the subnet access to the internet
  prohibit_public_ip_on_vnic = false
  dns_label                  = "publicSubnet"

}
# Create a Compute Instance
# Check compute.tf

# Create a compartment
# resource "oci_identity_compartment" "JorgesVM" {
#   compartment_id = var.compartment_id
#   description = "This compartment was created with Terraform"
#   name = "my_compartimienting"
# }

## TODO:
# Create a Gateway
# Add route rule to the gateway
# Modify security list