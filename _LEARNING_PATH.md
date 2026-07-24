# dbt learning path for becoming a strong mid-level engineer

This repo is meant to help you move beyond "I know basic SQL" and toward "I can understand and contribute to a real dbt project quickly".

## What separates a junior from a mid-level dbt engineer?

A junior engineer can usually:
- write simple models in SQL
- run dbt commands and fix obvious syntax errors
- follow a straightforward folder structure

A mid-level engineer can also:
- understand how a project is organized and why
- reason about dependencies, lineage, and data freshness
- write reusable macros and tests
- debug failures in staging, tests, docs, or deployment pipelines
- work in an unfamiliar repo without needing hand-holding

## What you should learn in order

### 1. Understand the anatomy of a dbt project
Learn these files and folders first:
- dbt_project.yml: project configuration, model paths, naming, materializations
- models/: transformation logic, usually split by layer
- seeds/: CSV files loaded into the warehouse
- snapshots/: slowly changing dimensions and historical data
- macros/: reusable SQL and Jinja logic
- packages.yml: external dbt packages
- profiles.yml: warehouse connection settings

### 2. Learn the common dbt layers
A well-structured project usually has layers such as:
- staging: cleans and standardizes raw data
- intermediate: business logic and joins
- marts: final tables used by analytics or reporting

The ability to read a project and identify these layers is a big step toward mid-level maturity.

### 3. Learn the production mindset
Mid-level dbt engineers think about:
- testing: generic tests, singular tests, and expectations
- documentation: model descriptions, sources, and docs generation
- data quality: not just SQL correctness, but trustworthy data
- performance: avoiding expensive transformations and keeping models maintainable
- maintainability: clear naming, reuse, and readable structure

### 4. Practice with a realistic project structure
Try building a small project that includes:
- sources from raw data
- staging models
- one or two intermediate models
- a final mart model
- tests for uniqueness, not-null, and relationships
- a macro for a repeated pattern

### 5. Learn how to read any company dbt project quickly
When you join a new repo, start here:
1. Open dbt_project.yml
2. Read the model folders and naming conventions
3. Check sources and exposures
4. Review tests and documentation
5. Follow the dependency chain from one model to another

That process helps you orient yourself much faster than trying to read every file.

## Suggested progression

### Week 1: fundamentals
- install dbt locally
- create a minimal project
- understand models, sources, and dbt build

### Week 2: structure and quality
- add tests
- add documentation
- organize models by layer

### Week 3: reuse and scale
- use macros
- add packages such as dbt_utils
- understand how packages and seeds fit into a project

### Week 4: production habits
- think about maintainability and performance
- read an existing public dbt project and compare it to your own
- practice explaining the purpose of each folder and model

## Recommended commands

```bash
# activate your environment
source .venv/bin/activate

# run dbt commands
 dbt debug
 dbt deps
 dbt seed
 dbt run
 dbt test
 dbt docs generate
 dbt docs serve
```

## Final mindset shift

The real difference is not just writing SQL. It is being able to understand why a project is structured a certain way, how to keep it reliable, and how to make changes safely in a team environment.
