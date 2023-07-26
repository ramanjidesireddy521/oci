

provider "oci" {
  tenancy_ocid = "ocid1.tenancy.oc1..aaaaaaaaposae6cowatr3hfig5t46rhds6eapjn5a2rmovousqs76cyo43ta"
  user_ocid        = "ocid1.user.oc1..aaaaaaaa7lfc6skhcu5bmfqy6aomnr2brdjsuomz5lanxtiqltjrtcxgkgga"
  private_key_path = "../.keys/oci.pem"
  fingerprint      = "74:ef:ea:c8:98:bb:51:8b:74:b2:1a:04:06:76:01:fb"
  region           = "us-ashburn-1"
}

# resource "oci_marketplace_accepted_agreement" "test_accepted_agreement" {
#   #Required
#   agreement_id    = oci_marketplace_listing_package_agreement.test_listing_package_agreement.agreement_id
#   compartment_id  = var.compartment_id
#   listing_id      = data.oci_marketplace_listing.test_listing.id
#   package_version = data.oci_marketplace_listing.test_listing.default_package_version
#   signature       = oci_marketplace_listing_package_agreement.test_listing_package_agreement.signature
# }


# data "oci_marketplace_accepted_agreement" "test" {
#     #Required
#     agreement_id = oci_marketplace_agreement.test.id
#     compartment_id = "ocid1.compartment.oc1..aaaaaaaas3bff43winmz2gxro25hznes4unmwyfgf7pibp4qkknpy6khtqvq"
#     listing_id = "55537798"
#     package_version = "9.2.046"
#     # signature = var.accepted_agreement_signature

#     #Optional
#     defined_tags = {"Operations.CostCenter"= "42"}
#     display_name = "sample"
#     freeform_tags = {"Department"= "Finance"}
# }

data "oci_marketplace_listing_package_agreements" "get_agreements" {
#Required
listing_id = "55537798"
package_version = "9.2.046"

#Optional
compartment_id = "ocid1.compartment.oc1..aaaaaaaas3bff43winmz2gxro25hznes4unmwyfgf7pibp4qkknpy6khtqvq"
}

#2
resource "oci_marketplace_listing_package_agreement" "sample_agreement" {
 agreement_id = data.oci_marketplace_listing_package_agreements.get_agreements.id
listing_id = "55537798"
package_version = "9.2.046"

#Optional
compartment_id = "ocid1.compartment.oc1..aaaaaaaas3bff43winmz2gxro25hznes4unmwyfgf7pibp4qkknpy6khtqvq"
}

#3
resource "oci_marketplace_accepted_agreement" "accepted_agreement" {
#Required
agreement_id = "18088784"
compartment_id = "ocid1.compartment.oc1..aaaaaaaas3bff43winmz2gxro25hznes4unmwyfgf7pibp4qkknpy6khtqvq"
listing_id = "55537798"
package_version = "9.2.046"
signature = oci_marketplace_listing_package_agreement.sample_agreement.signature
}
