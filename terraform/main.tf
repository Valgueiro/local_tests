# Configuration using provider functions must include required_providers configuration.
terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
  }

  required_version = ">= 1.7.5"
}

variable "vms" {
  default = ["valgueiro"]
}

locals {
    vms = ["valgueiro"]
}

resource "local_file" "foo" {
  content  = "foo!"
  filename = "${path.module}/mvalgueiro_tests/${each.value}/${each.key}"
  for_each = { for idx, val in var.vms : idx => val }
}
