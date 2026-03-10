# Example 01 - Pin Everything

This example shows the first rule of the talk: **pin the runtime and provider versions**.

## Why it matters

Without version constraints, the same code may behave differently next week, next month, or in another CI runner.

## Run it

```bash
tofu init
tofu plan
tofu apply -auto-approve
```

## What to notice

- `required_version` constrains the OpenTofu/Terraform language version.
- `required_providers` constrains provider versions.
- The same module can now be reused with predictable behavior.
