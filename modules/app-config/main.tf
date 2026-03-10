terraform {
  required_version = ">= 1.6.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = ">= 2.4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.5.0"
    }
  }
}

resource "random_pet" "suffix" {
  length = 1
}

resource "local_file" "config" {
  filename = "${path.root}/${var.app_name}-${var.environment}.txt"
  content  = <<-EOT
  app_name=${var.app_name}
  environment=${var.environment}
  generated_suffix=${random_pet.suffix.id}
  EOT
}
