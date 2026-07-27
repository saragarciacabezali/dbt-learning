# dbt Commands Reference

This document summarizes the main dbt CLI commands you can run in a dbt project, along with a short explanation of what each one does.

> The exact command set may vary slightly depending on your dbt version and installed adapter, but the commands below are the most commonly used in real projects.

## How to explore commands

You can always inspect the available commands directly in the terminal:

```bash
dbt --help
dbt <command> --help
```

Examples:

```bash
dbt run --help
dbt docs --help
```

---

## 1. Project setup and environment commands

### dbt init
Creates a new dbt project scaffold.

```bash
dbt init my_project
```

Use this when you want to start a new dbt repository from scratch.

### dbt debug
Checks whether dbt can connect to your warehouse and whether your project configuration is valid.

```bash
dbt debug
```

Use this when you want to troubleshoot connection issues, credentials, or profile problems.

### dbt deps
Installs packages declared in your `packages.yml` file.

```bash
dbt deps
```

Use this after adding external packages such as `dbt_utils`.

### dbt clean
Removes build artifacts such as generated files and folders from the `target/` directory.

```bash
dbt clean
```

Use this to reset local build output before rerunning the project.

### dbt version
Shows the installed dbt version.

```bash
dbt --version
```

Use this to confirm which version of dbt is installed.

---

## 2. Project validation and compilation commands

### dbt parse
Parses the project and validates its structure without executing anything.

```bash
dbt parse
```

Use this to catch syntax or configuration issues early.

### dbt compile
Compiles your dbt SQL into executable SQL for the warehouse.

```bash
dbt compile
```

Use this when you want to inspect the generated SQL without running models.

### dbt ls
Lists resources in the project such as models, seeds, snapshots, and tests.

```bash
dbt ls
```

Use this to inspect what dbt sees in your project.

### dbt show
Shows the SQL generated for a specific resource or query.

```bash
dbt show --select my_model
```

Use this to preview the SQL that dbt would run.

---

## 3. Data build commands

### dbt seed
Loads CSV files from the `seeds/` directory into the warehouse.

```bash
dbt seed
```

Use this for reference data, lookup tables, or small static datasets.

### dbt run
Executes the selected models in the warehouse.

```bash
dbt run
```

Use this to build your transformed tables.

### dbt run-operation
Runs a macro directly.

```bash
dbt run-operation my_macro
```

Use this when you want to execute reusable logic defined in a macro.

### dbt snapshot
Applies snapshot logic for slowly changing dimensions (SCDs).

```bash
dbt snapshot
```

Use this when you need to track historical changes to rows over time.

### dbt build
Runs seeds, models, snapshots, and tests in the right dependency order.

```bash
dbt build
```

Use this as an all-in-one command for a full pipeline run.

---

## 4. Testing and quality commands

### dbt test
Runs tests defined in your project, such as unique, not null, and relationship tests.

```bash
dbt test
```

Use this to validate your data quality assumptions.

### dbt source freshness
Checks whether source data is fresh according to the freshness configuration.

```bash
dbt source freshness
```

Use this to monitor whether upstream data is arriving on time.

### dbt retry
Retries the most recent failed dbt command.

```bash
dbt retry
```

Use this to quickly rerun after fixing a transient or known issue.

---

## 5. Documentation commands

### dbt docs generate
Generates the documentation site from your project metadata.

```bash
dbt docs generate
```

Use this after adding model descriptions, tests, and source documentation.

### dbt docs serve
Starts a local web server to view generated documentation.

```bash
dbt docs serve
```

Use this to open the dbt documentation in a browser.

---

## 6. Common selection patterns

dbt commands are often combined with selectors to choose specific resources.

Examples:

```bash
dbt run --select my_model
dbt test --select tag:finance
dbt build --select path:models/staging
```

Useful selection options include:

- `--select`: choose specific models or tags
- `--exclude`: exclude specific resources
- `--full-refresh`: rebuild incremental models from scratch
- `--vars`: pass variables to your project
- `--profiles-dir`: point to a custom profile directory
- `--target`: choose a specific target from your profile

---

## 7. Quick command cheat sheet

```bash
# project setup
dbt init my_project
dbt debug
dbt deps
dbt clean

# validation
dbt parse
dbt compile
dbt ls
dbt show

# build data
dbt seed
dbt run
dbt snapshot
dbt build
dbt run-operation my_macro

# quality and docs
dbt test
dbt source freshness
dbt retry
dbt docs generate
dbt docs serve
```

---

## 8. Practical advice

A good beginner workflow is:

1. `dbt debug` to verify the connection
2. `dbt deps` to install packages
3. `dbt parse` to validate the project
4. `dbt seed` to load reference data
5. `dbt run` or `dbt build` to execute transformations
6. `dbt test` to validate data quality
7. `dbt docs generate` and `dbt docs serve` to document the project

If you want to learn the commands faster, practice them in this repository and read the output of each one carefully.
