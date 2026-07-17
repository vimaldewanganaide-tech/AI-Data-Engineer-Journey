# DevOps Notes

## Beginner

- DevOps combines development and operations to deliver software reliably.
- Core concepts:
  - version control with Git
  - containerization with Docker
  - continuous integration and delivery (CI/CD)
- Common tools:
  - Git, GitHub, GitLab
  - Docker for container images
  - CI/CD pipelines for automated testing and deployment

## Intermediate

- Git:
  - branching strategies: feature branches, trunk-based development
  - merge vs rebase
  - stash and cherry-pick for managing changes
- Docker:
  - build container images with `Dockerfile`
  - use multi-stage builds for smaller images
  - manage containers with `docker run`, `docker compose`
- CI/CD:
  - run tests automatically on each commit
  - build artifacts and deploy to staging or production
  - integrate linting, security scanning, and quality checks
- Linux basics:
  - shell commands, file permissions, processes
  - use SSH to access remote systems
  - manage services and logs

## Advanced

- Infrastructure as Code:
  - define cloud resources with Terraform or AWS CloudFormation
  - version infrastructure alongside application code
- Docker best practices:
  - keep images small
  - avoid storing secrets in images
  - use runtime configuration and environment variables
- CI/CD pipelines:
  - support blue/green or canary deployments
  - automate rollbacks and monitoring
  - use pipelines to deploy data workflows and ML models
- Security and compliance:
  - scan container images for vulnerabilities
  - enforce policy checks in CI pipelines
  - secure credentials with vaults or secret stores
