# dbt Learning Project

This repository is a simple starting point for learning dbt and practicing data transformations in a way that mirrors how real analytics engineering work is structured.

## What this repo is for

The goal is not just to learn syntax. The goal is to become someone who can:
- set up a dbt project from scratch
- understand the purpose of each part of a dbt repo
- jump into an unfamiliar company project and orient yourself quickly
- build reliable models with tests, documentation, and maintainable structure

## Requirements

Before getting started, make sure you have:

- Python 3.9+ (recommended 3.10 or newer)
- Git
- A terminal with shell access

## Initial Setup

From the project root, run:

```bash
cd ~/projects/dbt-learning
python3 -m venv .venv
source .venv/bin/activate
pip install dbt-core dbt-bigquery
```

These commands create an isolated Python environment and install dbt with the BigQuery adapter.

If you want a quick shell alias for this project, run:

```bash
make install-alias
```

You can then use:

```bash
dbt-learning
```


## Helpful note

If you are using BigQuery, make sure your profile is configured for the BigQuery adapter and that your credentials are available in your environment.
