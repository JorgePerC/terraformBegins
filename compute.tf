resource "oci_core_instance" "my_compute_instance" {
  # Required
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = var.compartmentDetails.ocid
  shape               = "VM.Standard1.1"#"VM.Standard.E5.Flex"#"VM.Standard.A1.Flex"

# As we are using a flex shape, then htis is needed
#   shape_config {
#     baseline_ocpu_utilization = "BASELINE_1_2"
#     ocpus = 1
#     memory_in_gbs = 6
#   }

  source_details {
    source_id   = "ocid1.image.oc1.iad.aaaaaaaaszr5wpipg6qskiol3fhbitm56qdmumpbcpv6irzxuofi2nfmlhma"
    #"ocid1.image.oc1.iad.aaaaaaaacw5df4asqusifrn2gihgphgniip7o2tnffmcdyamgw57wdrr4b7q"
    source_type = "image"
  }

  # Optional
  display_name = "JorgesVM"
  create_vnic_details {
    # While this block is optional, it can
    # Configure the CI when creating the primary VNIC during instance launch 
    # or when creating a secondary VNIC
    assign_public_ip          = true
    subnet_id                 = oci_core_subnet.publicSubnet.id
    #assign_private_dns_record = true
  }
  metadata = {
    # Metadata key/value pairs
    # A metadata service runs on every launched instance
    ssh_authorized_keys = file("./keys/terraformKey.pub")
  }
   preserve_boot_volume = false
}