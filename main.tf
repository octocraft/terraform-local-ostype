terraform {
  required_version = ">= 0.11"
}

locals {
  type = "${"${file("${path.module}/conf/ext\\ext")}" == "${file("${path.module}/conf/ext/ext")}" ? "windows" : "unix"}"
}
