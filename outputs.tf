/*
* This file contains a list of variables that are displayed when you type
* the "terrafrom show" command. 
*/

output "vcn_state" {
  description = "The state of the VCN"
  value       = oci_core_vcn.internal.state
}

output "vcn_cidr" {
  description = "CIDR block of the core VCN"
  value       = oci_core_vcn.internal.cidr_block
}

output "availability_domain" {
  description = "Hopefully list ads"
  value       = data.oci_identity_availability_domains.ads.availability_domains
}
output "selected_ad" {
  description = "Validate the value is being passed correctly"
  value = data.oci_identity_availability_domains.ads.availability_domains[0].name
}

output "shapesAvailable" {
  value = data.oci_core_shapes.test_shapes.shapes
}
