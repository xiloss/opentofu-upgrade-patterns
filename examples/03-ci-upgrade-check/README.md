# Example 03 - Automate Upgrades

This example is meant to be executed through CI or by the helper script.

## Run locally

```bash
../../scripts/upgrade-check.sh
```

## What it does

1. Initializes the working directory with upgrade mode enabled.
2. Checks formatting.
3. Validates the configuration.
4. Generates a plan.

This is the core operational pattern from the talk:
**make upgrades routine, visible, and testable before production**.
