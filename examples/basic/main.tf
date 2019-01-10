module "example" {
  source = "../../"

  namespace   = "ACME"
  stage       = "Dev"
  name        = "Example"
  delimiter   = "-"
  attributes  = ["1", "2", "3"]
  byte_length = 4

  tags = {
    ManagedBy = "Terraform"
  }
}

output "id" {
  value = "${module.example.id}"
}
