# dbt config summary

This guide summarizes the key configuration files for this dbt project and explains how they work together.

## Files involved

- `dbt_project.yml` — project configuration and folder layout
- `profiles.yml` — connection configuration for BigQuery

`packages.yml` is optional and only needed if you install reusable dbt packages.

## What each file does

### dbt_project.yml

This file defines the project structure and default behavior of models.

In this repo, `dbt_project.yml` contains:
- `name: dbt_learning`
- `version: '1.0.0'`
- `config-version: 2`
- `profile: dbt_learning`
- folder paths for `models`, `analysis`, `tests`, `seeds`, `macros`, and `snapshots`
- a `target-path` and `clean-targets`
- default materialization for `models.dbt_learning.staging` set to `view`

Example:

```yaml
name: dbt_learning
version: '1.0.0'
config-version: 2

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
      keyfile: ./keys/BIGQUERY.json
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

- The connection was successfully verified with `dbt debug` once the service account and permissions were correct.
- The current `profiles.yml` uses `method: service-account` and the key at `./keys/BIGQUERY.json`.

## When to update these files

- `dbt_project.yml` changes when you add or reorganize model folders, change materializations, or add project-level configuration.
- `profiles.yml` changes when you switch warehouses, environments, or credentials.
- `packages.yml` changes when you add or upgrade dbt packages.


## Check if any of this is not in the documentation already:

## First concepts to understand

A dbt project usually relies on three important configuration files:

- **dbt_project.yml**: the main project file. It defines the project name, folder structure, default materializations, and overall configuration.
- **packages.yml**: the dependency file. It lists reusable dbt packages, such as dbt_utils or dbt_expectations.
- **profiles.yml**: the connection file. It contains the warehouse connection details for your target environments, such as dev and prod.

### How they work together
- **dbt_project.yml** tells dbt what the project is and how it should behave.
- **packages.yml** tells dbt which external packages the project should use.
- **profiles.yml** tells dbt where to connect and run the project.

When you add or change packages in packages.yml (as well for first installation), run ```dbt deps```. This will download the packages into the project’s dbt_packages folder so they can be used by your models and macros.