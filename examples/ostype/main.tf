module "os" {
  source = "git::https://github.com/octocraft/terraform-local-ostype?ref=v1.0.0"
}

output "type" {
  value = "${module.os.type}"
}
