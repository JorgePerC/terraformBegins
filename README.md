# Before you begin:

To connect to the OCI servers, init a valid session

    oci session authenticate

The session has a "running" time of 1 hour. So you need to refresh it with the command:

    oci session refresh --profile learn-terraform

If disconnected, then simply run the auth step again

This was obtained from the [Terraform - OCI tutorials ](https://developer.hashicorp.com/terraform/tutorials/oci-get-started/oci-build)

**NOTE:** The `terraform init` loads all the `.tf` files in the current directory. And components are not created in a sequential manner. If one fails, the rest can still be deployed.  

# Terraform CLI commands:

## Initialize configuration directory.

    terraform init

Similar to a catkin directory, this command initializes a "workspace", where you can easily track the configurations, state and logs of your instances.

The `variables.tf` files only declares the variables. Actual contents are stored in terraform `terraform.tfvars`

## File validation.

    terraform fmt
    terraform validate

The `fmt` stands for format. This basically standardizes any configuration file. 
The `validate` on the hand, checks for syntax errors, but also formats it. 

## Create infrastructure

    terraform apply

This will call the API of the corresponding provider and create the resources defined at the configuration file. 

    terraform show

Displays the contents of the file `terraform.tfstate`, which is the current configuration.

"Terraform stores the IDs and properties of the resources it manages in this file, so that it can update or destroy those resources going forward."

So, be careful about this file... and perhaps don't modify it?

    terraform state list

List the resources being managed. 

## Changes:

If you whish to make changes to the running platform, it's as easy as modifying the `main.tf` file. And to see the changes before committing... 

    terraform plan

Once your sure, simply run

    terraform apply

## Variables

1. First, declare type and defaults are `terraform.tfvars`
1. Then define values at `variables.tf`
1. Reference in the `main.tf` file. Note how the variables are not quoted.

## Easily monitor resources

Terraform provides a way to easily display certain resources with the command:

    terraform output

To configure the contents of this command, the file `outputs.tf` is required. 

Also, if you'd like to check for the current configuration, simply run 

    terraform show

To check for components:

    terraform state list
---------------


## Links to documentation details:

* [Shape types for compute hosts](https://docs.oracle.com/en-us/iaas/Content/Compute/References/computeshapes.htm#vmshapes__vm-standard)
* [Image ISOs OCIDs](https://docs.oracle.com/en-us/iaas/images/image/1fff95d3-1318-4036-87c2-56f13f740426/)
* [General tags documentation](https://registry.terraform.io/providers/oracle/oci/latest/docs)
* [Useful tutorials](https://docs.oracle.com/en-us/iaas/developer-tutorials/tutorials/home.htm)
* [Variables expansion](https://developer.hashicorp.com/terraform/language/values)

deleteMe