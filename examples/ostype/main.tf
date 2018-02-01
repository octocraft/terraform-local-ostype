module "os" {
  source = "github.com/octocraft/terraform-local-ostype"
}

output "type" {
  value = "${module.os.type}"
}
