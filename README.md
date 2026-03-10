# OpenTofu Upgrade Patterns

Minimal examples for a lightning talk on **staying in sync with OpenTofu and Terraform modules**.

This repo is intentionally small. It shows three practical rules:

1. **Pin everything**: lock the OpenTofu/Terraform runtime and provider versions.
2. **Treat modules like APIs**: version modules with semantic versioning.
3. **Automate upgrades**: run upgrade checks in CI before changes reach production.

The examples are designed to be simple and local-friendly. They use the `random` and `local` providers so you can test them without a cloud account.

## Repo layout

```text
.
├── .github/workflows/validate.yml
├── examples
│   ├── 01-pin-everything
│   ├── 02-module-versioning
│   └── 03-ci-upgrade-check
├── modules
│   └── app-config
├── scripts
│   └── upgrade-check.sh
└── README.md
```

## What this repo demonstrates

### 1) Pin everything
See [`examples/01-pin-everything`](./examples/01-pin-everything).

It pins:
- the OpenTofu/Terraform language version
- the provider versions

This protects your CI pipeline from unexpected dependency changes.

### 2) Treat modules like APIs
See [`examples/02-module-versioning`](./examples/02-module-versioning).

The module in [`modules/app-config`](./modules/app-config) is local in this demo, but the README shows how you would consume it from a tagged Git source in a real repository.

Suggested semantic versioning policy:
- **MAJOR**: breaking inputs/outputs or behavior changes
- **MINOR**: new backward-compatible features
- **PATCH**: bug fixes and documentation improvements

### 3) Automate upgrades
See [`examples/03-ci-upgrade-check`](./examples/03-ci-upgrade-check), the helper script in [`scripts/upgrade-check.sh`](./scripts/upgrade-check.sh), and the GitHub Actions workflow in [`.github/workflows/validate.yml`](./.github/workflows/validate.yml).

The workflow runs:
- `tofu init -upgrade`
- `tofu fmt -check`
- `tofu validate`
- `tofu plan`

This is the practical pattern behind the talk message: **find upgrade issues in CI, not in production**.

## Quick start

### Prerequisites

Install one of the following:
- **OpenTofu**
- **Terraform**

The examples are written to be compatible with both. Commands below use `tofu`.

### Run the first example

```bash
cd examples/01-pin-everything
tofu init
tofu plan
tofu apply -auto-approve
```

You should see a local file created in the example directory.

### Run the upgrade-check example

```bash
cd examples/03-ci-upgrade-check
../../scripts/upgrade-check.sh
```

## Real-world follow-up after the talk

If you want to extend this repo for production use, the next steps are:

1. Publish reusable modules in their own repositories.
2. Tag releases using semantic versioning.
3. Add policy checks, security scanning, and provider lock files.
4. Test upgrades with pull requests created by bots such as Renovate or Dependabot.
5. Promote changes through dev, staging, and production with the same pinned versions.

## Example of a versioned Git module source

In a real repository, you would consume a module like this:

```hcl
module "app_config" {
  source = "git::https://github.com/your-org/app-config-module.git?ref=v1.2.0"

  app_name    = "demo"
  environment = "dev"
}
```

That `ref` is the important point for the talk: **modules should be consumed like versioned APIs, not as floating code**.

## Suggested talk QR usage

Point your QR code to this repo so people can leave with:
- one minimal example they can run immediately
- one module versioning pattern they can copy
- one CI workflow they can adapt the same day

## License

MIT
