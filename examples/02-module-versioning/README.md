# Example 02 - Treat Modules Like APIs

This example uses the same local module, but the important point is **how you would publish and consume it in real life**.

## Local in the demo, versioned in real life

In this demo, the module source is local:

```hcl
module "app_config" {
  source = "../../modules/app-config"
}
```

In a real repository, you would use a tagged source:

```hcl
module "app_config" {
  source = "git::https://github.com/your-org/app-config-module.git?ref=v1.2.0"

  app_name    = "semver-demo"
  environment = "stage"
}
```

## Suggested semantic versioning policy

- **v1.0.0** - first stable release
- **v1.1.0** - new optional variable added, no breaking change
- **v1.1.1** - bug fix only
- **v2.0.0** - breaking input, output, or behavior change

## Talk takeaway

A shared infrastructure module is a contract.
Treat it like an API and version it accordingly.
