# Source from https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/identity_availability_domains
/*
  In Terraform, to fetch data, you use a data source. 
  Fetching data from a data source is similar to the GET method in REST APIs.
  If you would like to know eveything that can ve fetched from the server,
  check the Terraform registry /Data sources
*/

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.tenancy_id
}

data "oci_core_shapes" "test_shapes" {
    #Required
    compartment_id = var.compartment_id

    #Optional
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
}

