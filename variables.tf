/*
  This file contains variable declaration. These are "local variables",
  in the sense that they remain on the workspace, but there are more 
  options.
  Check https://developer.hashicorp.com/terraform/language/values
  
*/
variable "tenancy_id" {
  description = "OCID for the tenancy"
  type        = string
}
variable "compartment_id" {
  description = "OCID from your tenancy page"
  type        = string
}
variable "region" {
  description = "region where you have OCI tenancy"
  type        = string
  default     = "us-ashburn-1"
}

variable "armUbuntuImage" {
  description = "ocid for the iso"
  type        = string
  default     = "ocid1.image.oc1.mx-queretaro-1.aaaaaaaaqlutud67zfpuprw6oemurxwztkk3vtpm7yd6xxabfhx2xlpckbaa"
}

variable "compartmentDetails" {
  type = list(object({
    ocid = string
    name = string
  }))
}