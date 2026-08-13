# CKS (Certified Kubernetes Security Specialist) – Hands-On Course

[![Killer Coda](https://img.shields.io/badge/Killer%20Coda-Interactive-blue)](https://killercoda.com/)
[![CKS Exam](https://img.shields.io/badge/CKS-Exam%20Prep-green)](https://www.cncf.io/certification/cks/)

## 🎯 Course Overview

Hands-on preparation course for the **Certified Kubernetes Security Specialist (CKS)** exam, built entirely around **interactive KillerCoda scenarios**.

The content is aligned with the **current CKS exam blueprint** and focuses on real-world, task-oriented security skills rather than theory. Scenarios are organized by exam domain and will grow over time as the course evolves.

> For the latest official CKS details (including version, blueprint, and policies), always refer to the CNCF website.

## 📚 Exam Domain Coverage

The course is structured around the official CKS domains and their current weightings:

| Domain | Weight (subject to change by CNCF) | Focus Areas (examples) |
|--------|------------------------------------|-------------------------|
| **Cluster Setup** | ~10% | Network Security Policies, CIS Benchmarks, Ingress TLS, node metadata, platform binaries |
| **Cluster Hardening** | ~15% | API access, RBAC, service accounts, upgrades, secrets, security primitives |
| **System Hardening** | ~15% | Host OS footprint, IAM, OS configuration, system logs, container runtime |
| **Minimize Microservice Vulnerabilities** | ~20% | Namespace isolation, NetworkPolicies, Pod Security, OS security domains, runtime security, audit logging, pod-to-pod encryption |
| **Supply Chain Security** | ~20% | Base images, supply-chain trust, manifest analysis, image vulnerability scanning |
| **Monitoring, Logging & Runtime Security** | ~20% | Behavioral Analytics, Physical Infrastructure Threats, Workload Threats, Audit Logs |

> Note: Domain names, weights, and scope may change in future CKS releases. This course will be updated over time to track those changes.

## 🚀 Getting Started

### Prerequisites

Before starting, you should be comfortable with:

- Kubernetes fundamentals (CKA-level knowledge or equivalent)
- Linux basics and security concepts (processes, permissions, networking)
- YAML, `kubectl`, and working in a terminal

### Course Structure

Each scenario is designed to be:

- **Interactive** – Runs in a pre-configured Kubernetes environment on KillerCoda
- **Guided** – Includes step-by-step instructions and explanations
- **Task-Driven** – Focuses on concrete, exam-style tasks
- **Verifiable** – Provides checks/commands to validate your work
- **Realistic** – Uses patterns and practices relevant to production clusters

As the course evolves, new scenarios and refinements may be added without changing the overall structure.

## 📖 Scenario Overview

Below is a high-level overview of the scenario themes in each domain.
Scenario names and counts may grow over time, but the focus areas will remain consistent.

### 🔧 Cluster Setup (~10%)

Example scenarios:

- **Network Security Policies** – Restrict cluster-level access
- **CIS Benchmarks** – Review Kubernetes security configuration
- **Ingress and Egress TLS** – Restrict and encrypt network traffic
- **Node Metadata and Endpoints** – Protect instance metadata and sensitive endpoints
- **Platform Binary Verification** – Verify Kubernetes platform binaries

### 🛡️ Cluster Hardening (~15%)

Example scenarios:

- **Restrict Kubernetes API Access**
- **RBAC and Service Accounts**
- **Kubernetes Upgrades**
- **Secrets and Kubernetes Security Primitives**

### 🔒 System Hardening (~15%)

Example scenarios:

- **Host OS Footprint and IAM Roles**
- **External Access and Host OS Configuration**
- **System Logs and Container Runtime Security**

### 🐳 Minimize Microservice Vulnerabilities (~20%)

Example scenarios:

- **Namespace Isolation and NetworkPolicies**
- **Pod Security Standards**
- **OS-Level Security Domains** – AppArmor and seccomp
- **Container Runtime Security**
- **Audit Logging and Pod-to-Pod Encryption**

### 📦 Supply Chain Security (~20%)

Example scenarios:

- **Base Image Footprint**
- **Supply-Chain Trust and Provenance**
- **Static Kubernetes Manifest Analysis**
- **Image Vulnerability Scanning**

Every syllabus topic is split into four independent KillerCoda scenarios so
each stage starts with a fresh environment:

```text
<topic>-learn
<topic>-required
<topic>-inferno
<topic>-production
```

Each stage directory contains its own `index.json`, setup script, lessons,
questions, checks, and finish page. KillerCoda discovers these stage directories
directly under their CKS domain.
### 📊 Monitoring, Logging & Runtime Security (~20%)

Example scenarios:

- **Behavioral Analytics** – Analyze system and workload behavior
- **Physical Infrastructure Threats** – Detect host-level threats
- **Workload Threat Detection** – Detect threats inside workloads
- **Kubernetes Audit Logs** – Configure and use audit logging

## 🎓 Learning Outcomes

By working through these scenarios, you will be able to:

- Configure and harden Kubernetes clusters with a security-first mindset
- Implement and enforce security policies across cluster, system, and workload levels
- Detect, investigate, and respond to runtime security events
- Improve the security of the container and image supply chain
- Build confidence to attempt and pass the **CKS certification exam**

> This course is intended as a practical complement to the official CKS curriculum and documentation, not a replacement.

## 🤝 Contributing

Contributions, bug reports, and improvements are very welcome.

- Feel free to open issues for:
    - Scenario corrections
    - New scenario ideas
    - Updates needed for new Kubernetes / CKS releases

## 📄 License

This project is licensed under the [MIT License](LICENSE).
