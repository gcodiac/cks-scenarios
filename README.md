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
| **Cluster Setup** | ~15% | RBAC, Network Policies, Security Contexts |
| **Cluster Hardening** | ~15% | API Server, Node Security, etcd Encryption |
| **System Hardening** | ~10% | Kernel Security, AppArmor, Seccomp |
| **Minimize Microservice Vulnerabilities** | ~20% | Pod Security, Admission Controllers, Secrets |
| **Supply Chain Security** | ~20% | Image Scanning, Signing, Policy Enforcement |
| **Monitoring, Logging & Runtime Security** | ~20% | Falco, Audit Logging, Incident Response |

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

### 🔧 Cluster Setup (~15%)

Example scenarios:

- **RBAC Configuration** – Implement fine-grained access control
- **Network Policies** – Configure network segmentation and traffic control
- **Security Contexts** – Apply pod and container security constraints

### 🛡️ Cluster Hardening (~15%)

Example scenarios:

- **API Server Hardening** – Secure API server configuration and authentication
- **Node Security** – Implement node-level security controls
- **etcd Encryption** – Configure encryption at rest for sensitive data

### 🔒 System Hardening (~10%)

Example scenarios:

- **Kernel Security** – Implement syscall filtering and kernel hardening
- **AppArmor & Seccomp** – Configure application and system call security profiles

### 🐳 Minimize Microservice Vulnerabilities (~20%)

Example scenarios:

- **Pod Security Standards** – Implement Pod Security Standards and policies
- **Admission Controllers** – Deploy and use admission webhooks
- **Secrets Management** – Secure secrets handling and external integration
- **Container Security** – Apply container image security best practices

### 📦 Supply Chain Security (~20%)

Example scenarios:

- **Image Scanning** – Automated vulnerability scanning and basic remediation workflows
- **Image Signing** – Implement signing and verification (e.g. with Cosign)
- **OPA Gatekeeper** – Policy enforcement with Open Policy Agent
- **Binary Authorization** – Secure deployment pipelines and attestation concepts

```text
cks/
└── 01-cluster-setup/
    │
    ├── 01-network-security-policies/
    │   ├── network-security-policies-learn/
    │   ├── network-security-policies-required/
    │   ├── network-security-policies-inferno/
    │   └── network-security-policies-production/
    │
    ├── 02-cis-benchmark/
    │   ├── cis-benchmark-learn/
    │   ├── cis-benchmark-required/
    │   ├── cis-benchmark-inferno/
    │   └── cis-benchmark-production/
    │
    ├── 03-ingress-tls/
    │   ├── ingress-tls-learn/
    │   ├── ingress-tls-required/
    │   ├── ingress-tls-inferno/
    │   └── ingress-tls-production/
    │
    ├── 04-node-metadata-endpoints/
    │   ├── node-metadata-endpoints-learn/
    │   ├── node-metadata-endpoints-required/
    │   ├── node-metadata-endpoints-inferno/
    │   └── node-metadata-endpoints-production/
    │
    └── 05-verify-platform-binaries/
        ├── verify-platform-binaries-learn/
        ├── verify-platform-binaries-required/
        ├── verify-platform-binaries-inferno/
        └── verify-platform-binaries-production/
```

So the convention throughout the entire CKS course becomes:

```text
<topic>-learn
<topic>-required
<topic>-inferno
<topic>-production
```
### 📊 Monitoring, Logging & Runtime Security (~20%)

Example scenarios:

- **Falco Runtime Security** – Deploy runtime threat detection rules
- **Audit Logging** – Configure and inspect Kubernetes audit logs
- **Anomaly Detection** – Behavioral monitoring and detection concepts
- **Incident Response** – Practice security incident investigation and response

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
