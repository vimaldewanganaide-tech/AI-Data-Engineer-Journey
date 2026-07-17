# Architecture Notes

## Beginner

- Architecture defines the structure of systems and how components interact.
- Common patterns:
  - monolithic applications
  - microservices
  - data lakes and warehouses
- Key goals:
  - reliability
  - scalability
  - maintainability

## Intermediate

- System design:
  - break problems into components and services
  - use APIs and message queues to connect systems
  - balance consistency, availability, and partition tolerance
- Data Lakehouse:
  - combine data lake storage with warehouse-style governance
  - support both analytics and machine learning workloads
- Event-driven architecture:
  - use events as the source of truth
  - build loosely coupled systems with producers and consumers
  - handle asynchronous data flows and retries
- Security:
  - authenticate and authorize users and services
  - encrypt data in transit and at rest
  - enforce least privilege access

## Advanced

- Scalability:
  - scale horizontally by adding compute resources
  - use partitioning and sharding for large datasets
  - design systems for elasticity and failover
- Cost optimization:
  - choose right-sized infrastructure
  - use managed services to reduce maintenance
  - monitor usage and optimize storage tiers
- Architecture reviews:
  - vet design decisions with cross-functional stakeholders
  - evaluate trade-offs for performance, cost, and complexity
  - document assumptions and architecture diagrams
