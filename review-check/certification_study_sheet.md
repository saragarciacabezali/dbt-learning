# dbt Certification Study Sheet

## 1. Core definition

- dbt is a tool for transforming data in a warehouse using SQL.
- It helps organize transformations into a structured project with models, tests, documentation, and dependencies.

## 2. Key concepts to remember

- Model: a dbt object that defines a transformation and produces a table, view, or other object in the warehouse.
- Source: an upstream dataset or table that a model reads from.
- Dependency: a relationship between objects that defines execution order.
- Lineage: the graph that shows how data flows through the project.
- Materialization: how a model is created in the warehouse, such as a view or table.

## 3. Important files

- dbt_project.yml: project configuration, including paths, project metadata, and default materializations.
- profiles.yml: warehouse connection settings and authentication details.
- models/: where the transformation logic lives.
- target/: where dbt stores generated artifacts from runs.

## 4. Common dbt commands

- dbt debug: checks whether the environment and connection are configured correctly.
- dbt run: compiles and executes selected models in dependency order.
- dbt test: runs tests defined for models and sources.
- dbt docs generate: builds documentation from the project metadata.
- dbt deps: installs project dependencies.

## 5. Why testing matters

- Testing helps verify data quality.
- It builds trust in the analytics layer.
- It reduces the chance of bad data reaching dashboards or reports.

## 6. Why documentation matters

- Documentation helps explain the purpose of models and the structure of the project.
- It makes onboarding and maintenance easier.
- It helps others understand the logic behind transformations.

## 7. Debugging mindset

- Check the generated SQL in the target folder.
- Look for syntax errors, missing references, or dependency issues.
- Compare what dbt compiled with what you expected to see.

## 8. Best exam-style answer patterns

- “dbt is a tool for transforming data in a warehouse using SQL in a structured and testable way.”
- “A model is a transformation defined in dbt and materialized in the warehouse.”
- “Dependencies define the execution order of models.”
- “Lineage shows how data flows between models and sources.”
- “Testing improves data quality and trust in the project.”

## 9. Common mistakes to avoid

- Confusing a source with a model.
- Thinking dbt is only about writing SQL without structure and testing.
- Forgetting that dependencies affect execution order.
- Ignoring the target folder when debugging.
