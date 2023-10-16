/*
    Technically, this script could be used for any Terrafrom-realted service that is requested
    from my local machine. However, there are several ways in which you can autentificate. 
    At the end of the day, remember that OCI is an Infrastrucure Provider, 
    so if you wish to use it's services, then you need to auth. 
    Check this for more: 
    https://registry.terraform.io/providers/oracle/oci/latest/docs

*/
/*
provider "oci" {
  tenancy_ocid = "<tenancy-ocid>"
  user_ocid = "<user-ocid>" 
  private_key_path = "<rsa-private-key-path>"
  fingerprint = "<fingerprint>"
  region = "<region-identifier>"
}
*/