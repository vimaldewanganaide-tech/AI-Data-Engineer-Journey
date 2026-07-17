# Day 04 Notes: ETL, Data Modeling, and SQL Workflows

## ETL vs ELT

- ETL: extract, transform, load.
  - Transform data before loading into the target.
- ELT: extract, load, transform.
  - Load raw data first, then transform inside the target system.
- Choose ETL for strict control, ELT for modern cloud warehouses.

## Data Modeling

- Star schema: fact table at center, dimensions around it.
- Dimension tables store descriptive attributes.
- Fact tables store metrics and foreign keys.
- Normalized models reduce redundancy; denormalized models improve query speed.

## SQL Joins

- `INNER JOIN`: returns rows present in both tables.
- `LEFT JOIN`: returns all left rows, with matching right rows.
- `RIGHT JOIN`: returns all right rows, with matching left rows.
- `FULL OUTER JOIN`: returns rows from both sides.

## Workflow Orchestration

- Airflow uses DAGs to express task dependencies.
- Tasks can be Python operators, Bash operators, or SQL operators.
- Scheduling, retries, and alerts are core orchestration features.
- Idempotency ensures pipelines can rerun safely.

## Data Quality

- Validate schema fields for type and nullability.
- Check for duplicates and missing values.
- Use simple rules like `NOT NULL`, `UNIQUE`, and range checks.

## Day 04 Learning Summary

- Design a simple ETL or ELT workflow.
- Build sample SQL queries using joins and aggregations.
- Understand how orchestration tools manage pipeline execution.
- Document the pipeline design and data model.
