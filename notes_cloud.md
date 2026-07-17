# Cloud Notes

## Beginner

- Cloud computing provides on-demand resources over the internet.
- AWS is a leading cloud provider with services for storage, compute, databases, and analytics.
- Core AWS services:
  - S3 for object storage
  - IAM for identity and access management
  - Lambda for serverless functions
  - Athena for interactive queries
  - Redshift for data warehousing

## Intermediate

- AWS S3:
  - buckets store objects and support versioning
  - lifecycle rules manage retention and tiering
  - ACLs and bucket policies control access
- IAM:
  - users, groups, roles, and policies manage permissions
  - use least privilege and role-based access
  - enable multi-factor authentication for security
- Glue:
  - managed ETL service for cataloging and transforming data
  - can discover schemas and generate code
- Lambda:
  - event-driven compute without provisioning servers
  - good for lightweight data tasks and microservices
- EMR:
  - managed Spark/Hadoop clusters for big data
  - run large-scale batch processing and analytics
- Athena:
  - serverless SQL queries over data in S3
  - great for ad hoc analysis without loading data
- Redshift:
  - columnar data warehouse for analytics
  - use clusters, workgroups, and RA3 nodes for performance

## Advanced

- Step Functions:
  - orchestrate serverless workflows and state machines
  - handle branching, retries, and parallel execution
- Cloud data architecture:
  - separate storage, compute, and metadata
  - use data lakehouse patterns for flexibility and performance
- Security and governance:
  - encrypt data at rest and in transit
  - use AWS Config and CloudTrail for auditing
  - enforce access controls with policies and roles
- Cost optimization:
  - choose appropriate storage classes and compute sizes
  - use reserved capacity and spot instances when possible
  - monitor usage and budgets regularly
