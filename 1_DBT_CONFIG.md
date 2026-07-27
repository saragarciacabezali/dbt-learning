# dbt config summary

This guide summarizes the key configuration files for this dbt project and explains how they work together.

## Files involved

- `dbt_project.yml` — project configuration, folder layout, and default model behavior
- `profiles.yml` — warehouse connection settings for your dbt targets
- `packages.yml` — optional dependency file for reusable dbt packages

A dbt project typically uses these files together:

- `dbt_project.yml` defines the project identity and how dbt should build models.
- `packages.yml` lists external packages to install.
- `profiles.yml` provides the connection details for the warehouse.

## What each file does

### dbt_project.yml

This file defines the project structure and default behavior of models.

In this repo, `dbt_project.yml` contains:
- `name: dbt_learning`
- `version: '1.0.0'`
- `profile: dbt_learning`
- folder paths for `models`, `analysis`, `tests`, `seeds`, `macros`, and `snapshots`
- a `target-path` and `clean-targets`
- default materialization for `models.dbt_learning.staging` set to `view`

Example:

```yaml
name: dbt_learning
version: '1.0.0'

profile: dbt_learning

model-paths: ["models"]
analysis-paths: ["analysis"]
test-paths: ["tests"]
seed-paths: ["seeds"]
macro-paths: ["macros"]
snapshot-paths: ["snapshots"]

target-path: "target"
clean-targets:
  - "target"
  - "dbt_packages"

models:
  dbt_learning:
    staging:
      +materialized: view
```

### profiles.yml

This file tells dbt how to connect to a warehouse.

In this repo, the profile is configured to use BigQuery with a service account:

```yaml
dbt_learning:
  target: dev
  outputs:
    dev:
      type: bigquery
      method: service-account
      project: project-ca830276-317b-4687-b78
      dataset: dbt_learning
      keyfile: ./keys/bigquery.json
      threads: 1
      timeout_seconds: 300
      location: US
      priority: interactive
```

Key points:
- `type: bigquery` selects the BigQuery adapter
- `method: service-account` uses the downloaded JSON key
- `project` is the GCP project ID
- `dataset` is the BigQuery dataset/schema where dbt builds objects
- `keyfile` points to the local JSON service account key

To verify a connection is succesful you can run `dbt debug`.

### packages.yml (optional)

This file is only necessary if you want to install reusable dbt packages such as `dbt_utils`.

A package declaration looks like:

```yaml
packages:
  - package: dbt-labs/dbt_utils
    version: [">=0.9.0", "<1.0.0"]
```

Then run:

```bash
dbt deps
```

This downloads package files into `dbt_packages/` so dbt can compile and use them.

## How `dbt deps` fits in

- `packages.yml` lists package dependencies.
- `dbt deps` downloads those package files into `dbt_packages/`.
- `dbt deps` must be run once after cloning the repo and again after any package changes.

`dbt deps` does not install the package into Python directly; it downloads dbt package code into the project folder for dbt to compile and use.

## Notes from this session
- The current `profiles.yml` uses `method: service-account` and the key at `./keys/bigquery.json`.

## When to update these files

- `dbt_project.yml` changes when you add or reorganize model folders, change materializations, or add project-level configuration.
- `profiles.yml` changes when you switch warehouses, environments, or credentials.
- `packages.yml` changes when you add or upgrade dbt packages.
