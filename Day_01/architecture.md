# Day 1 — Architecture: Filtering, Performance and Design Questions

This file explains why filtering is typically performed in SQL rather than in Python, the trade-offs, and how this affects performance, scaling, and production usage. It also includes 10 practical architecture questions with answers and examples suitable for Day 01 learning.

## Why should filtering happen in SQL?

- Data locality and I/O reduction: databases store and index data; filtering in SQL reduces the amount of data read from disk and sent over the network. Less I/O means faster queries and lower cost.
- Optimizer and predicate pushdown: modern query engines push down predicates into storage and use indexes, minimizing scanned rows.
- Security and governance: applying filters (row-level security, tenant filters) inside the database enforces access controls centrally.
- Consistency and correctness: putting filters in the query ensures all clients share the same logic and benefit from DB transaction semantics.

Example — SQL filter (preferred):

```sql
SELECT id, name, salary
FROM employees
WHERE department = 'Engineering' AND salary > 70000;
```

Why this is efficient: the planner can use an index on `department` or `salary`, read only matching pages, and return results without transferring the whole table.

## Why not Python?

- Data transfer overhead: reading entire tables into Python incurs network and I/O costs and may not fit memory.
- Loss of DB optimizations: Python-side filtering cannot leverage DB indexes, statistics, or predicate pushdown.
- Concurrency, transactions and consistency: Python code reading data outside transactions may see inconsistent snapshots unless carefully managed.

Example — Python filter (discouraged for large tables):

```python
import sqlite3
conn = sqlite3.connect('company.db')
rows = conn.execute('SELECT * FROM employees').fetchall()  # transfers all rows
filtered = [r for r in rows if r['department']=='Engineering' and r['salary']>70000]
```

When Python filtering is acceptable: small datasets, exploratory analysis, or when you need complex logic that cannot be expressed in SQL (rare). Prefer pushing filters to the DB first, then doing post-filtering in Python only when needed.

## Performance

- I/O dominates runtime for large datasets. Pushing filters to the DB reduces scanned rows and I/O.
- Indexes change complexity: a properly indexed `WHERE` clause can reduce work from O(n) scans to O(log n) index lookups.
- Network and serialization overhead: databases return compact rows; Python deserialization adds overhead per row.

Example measurement (conceptual):
- Table size: 10M rows. Full transfer to Python: read 10M rows (~GBs), deserialize in Python, then filter — slow and memory-heavy.
- SQL filtered query: DB scans few pages via index, returns 1k rows — fast.

## Trade-offs

- Flexibility vs Efficiency: Python offers unlimited algorithmic flexibility; DBs provide optimized set-based operations.
- Maintainability: SQL centralizes filtering logic (good for consistency), Python filters risk duplication across clients.
- Complexity: some complex transformations may be easier to express in Python (custom ML transforms), but pre-filtering in SQL still reduces data volume.

## Scaling

- Scale-up (bigger DB instances) and scale-out (distributed engines like Snowflake, BigQuery, Spark SQL) all benefit from predicate pushdown.
- When data is partitioned/sharded, co-locating filters with storage ensures minimal cross-node traffic.

Example — partition pruning:

```sql
-- partitioned table by date
SELECT * FROM events
WHERE event_date BETWEEN '2026-01-01' AND '2026-01-31';
```

The planner reads only the January partitions, which is far cheaper than scanning all partitions.

## Production usage

- Put simple, stable filters in SQL queries inside the pipeline (ETL, ELT) or views to ensure consistent behavior.
- Use stored procedures, parameterized queries, or views to centralize logic and avoid client-side duplication.
- Monitor query plans with `EXPLAIN` and track slow queries. Add indexes and statistics as needed.

Example: centralizing tenant filtering

```sql
CREATE VIEW tenant_employees AS
SELECT * FROM employees WHERE tenant_id = current_setting('app.tenant_id');

-- application uses the view, guaranteeing tenant isolation at the DB layer
SELECT id, name FROM tenant_employees WHERE salary > 50000;
```

---

## Ten (10) Architecture Questions for Day 01 — with answers and examples

1) Where should filtering happen: database or application?

- Answer: Prefer database for set-based filters, especially on large data. Use application filtering only for small or highly-custom logic after DB pre-filtering.
- Example: use `WHERE` in SQL to reduce rows before Python transformations.

2) When should I create an index for a column used in filtering?

- Answer: Create an index when a column is frequently used in `WHERE` clauses and the predicate selects a small fraction of rows. Avoid indexing low-cardinality columns unless combined with others.
- Example: index `salary` if queries often filter on salary ranges and select small subsets.

3) How does partitioning help filtering performance?

- Answer: Partitioning splits data into physical chunks (by date, tenant, etc.). Queries that filter on the partition key read fewer partitions (partition pruning), reducing I/O.
- Example: daily partitioning of logs — queries for a single day touch only that day's partition.

4) What are the trade-offs of pushing complex logic into stored procedures vs application code?

- Answer: Stored procedures keep logic close to data (better performance, transactions), but can be harder to test and maintain. Application code is easier to version and unit-test but may transfer more data.
- Example: a multi-step aggregation that needs transactional guarantees is a good candidate for a stored procedure.

5) How do statistics affect filtering and plan choice?

- Answer: The optimizer uses table and index statistics to estimate row counts and choose plans. Stale stats can cause poor plans; regular ANALYZE/UPDATE STATISTICS is important.
- Example: after loading bulk data, run `ANALYZE employees;` so the optimizer knows value distributions.

6) When should I prefer an analytical engine (BigQuery/Snowflake) vs a transactional DB for filtering?

- Answer: Use analytical engines for large-scale, read-heavy aggregations and ad-hoc analytics; use OLTP databases for frequent small writes and transactional consistency. Both support filtering, but analytical engines are optimized for scanning and aggregation at scale.
- Example: run monthly payroll aggregations in a data warehouse; run single-employee updates in OLTP.

7) How to handle filters that require complex business logic not expressible in SQL?

- Answer: Break work into pre-filtering in SQL to reduce rows, export intermediate results, then apply complex logic in Python. Alternatively, implement custom UDFs or use procedural languages (PL/pgSQL, UDFs in Spark).
- Example: pre-select 10k candidate records in SQL, then run advanced ML-based scoring in Python.

8) What monitoring should be in place to ensure filters work efficiently in production?

- Answer: Monitor slow queries, track execution plans, collect query latency histograms, and set alerts for regressions. Use APM and DB logs to spot missing indexes or bad plans.
- Example: schedule a job that captures `EXPLAIN ANALYZE` for key queries weekly and reports cost changes.

9) How does network topology affect the decision to filter in SQL vs Python?

- Answer: If the database is remote (network latency/cost high), push filters to SQL to minimize transferred rows. Co-locate compute with storage (cloud warehouses) if heavy processing is required.
- Example: querying a remote RDS instance — always filter with `WHERE` before fetching into a remote compute node.

10) When should I cache filtered results or materialize views?

- Answer: Cache or materialize when filters/aggregations are expensive and reused often. Materialized views store precomputed results and can be refreshed on a schedule.
- Example: materialize monthly sales totals for dashboards that query the same aggregation frequently.

---

If you'd like, I can also:
- Add runnable SQLite examples that show timing differences between SQL filtering and Python-side filtering.
- Create short exercises for students to run `EXPLAIN` and observe index/partition effects.

Which would you like next? 

