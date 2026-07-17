# Data Engineering Notes

## Beginner

- Data engineering builds systems to move, store, and transform data.
- Key concepts:
  - ETL: Extract, Transform, Load
  - batch processing vs streaming
  - pipelines: sequences of steps to prepare data
- Common tools and formats:
  - CSV, JSON, Parquet
  - relational databases and data warehouses
  - scripting languages like Python and SQL

## Intermediate

- ETL design:
  - extract from sources such as files, APIs, and databases
  - transform data by cleaning, normalizing, and enriching
  - load into target systems like warehouses or lakes
- Data modeling:
  - dimensional modeling for analytics
  - star schema with fact and dimension tables
  - normalized models for transactional systems
- Orchestration:
  - schedule and manage pipelines with frameworks like Airflow
  - handle dependencies, retries, and monitoring
- Data quality:
  - validate schema, completeness, and accuracy
  - implement checks for duplicates, nulls, and outliers

## Advanced

- Modern data stack:
  - data lake and lakehouse architectures
  - cloud storage: S3, Azure Data Lake, GCS
  - managed warehouses: Snowflake, Redshift, BigQuery
- Delta Lake and ACID on data lakes:
  - versioned tables and transaction logs
  - schema enforcement and evolution
- Streaming and event-driven data:
  - Kafka for messaging and event streams
  - micro-batch vs real-time processing
  - stateful stream processing
- DataOps and automation:
  - use CI/CD for data pipelines
  - deploy pipeline code, tests, and infrastructure safely
  - monitor data freshness and reliability

## Practical patterns

- Keep transformations idempotent and testable.
- Partition large datasets for efficient queries.
- Use metadata and documentation for data lineage.
- Build reusable components for common pipeline tasks.
