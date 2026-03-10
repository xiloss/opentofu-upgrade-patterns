terraform {
  required_version = "~> 1.8.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

module "app_config" {
  source = "../../modules/app-config"

  app_name    = "pinned-demo"
  environment = "dev"
}

output "generated_file" {
  value = module.app_config.config_file
}
