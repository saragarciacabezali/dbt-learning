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
- Access to a BigQuery project and dataset
- A Google Cloud service account JSON key file for BigQuery authentication

The project is currently configured to use a service account key at keys/bigquery.json via the profile in profiles.yml. In this repo, that means having the JSON key file at keys/BIGQUERY.json and permission to use the target project and dataset.

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

## How to use this repo as a learning tool

This project is meant to be both a working dbt starter and a place to reinforce what you learn. As you go through the basics, you can use the repo files as a reference and as a self-check:

- [1_DBT_CONFIG_SUMMARY.md](1_DBT_CONFIG_SUMMARY.md) explains the main configuration files and how they fit together.
- [2_DBT_COMMANDS_REFERENCE.md](2_DBT_COMMANDS_REFERENCE.md) gives you the core dbt commands and the purpose of each one.
- [review_questions.md](review_questions.md) lets you test your understanding step by step.
- [review_answers.md](review_answers.md) collects the polished answers so you can compare your thinking with a stronger version.
- [certification_study_sheet.md](certification_study_sheet.md) condenses the most important ideas into a compact certification-style summary.

In other words, the repo is not only a starter project — it is also a small learning notebook that you can revisit whenever you want to review the concepts.
