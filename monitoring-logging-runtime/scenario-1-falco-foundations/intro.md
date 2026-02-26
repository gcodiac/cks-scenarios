# Falco Runtime Security – Foundations

Welcome to this hands-on lab on runtime security in Kubernetes using Falco.

In this scenario, you will:

1. Deploy Falco into a Kubernetes cluster using the official upstream Kubernetes manifest.
2. Trigger runtime detections from inside a test pod.
3. Inspect Falco alerts.
4. Explore Falco rules and clean up resources.

---

## What is Falco?

Falco is a Cloud Native runtime security engine that monitors:

- System calls (syscalls)
- Kubernetes audit events
- Container runtime activity

Falco applies a rules engine to detect suspicious behavior such as:

- Shells spawned inside containers
- Access to sensitive files (e.g., `/etc/shadow`)
- Privileged container activity
- Unexpected network connections

Falco runs as a DaemonSet in Kubernetes, meaning one Falco pod runs on each node and monitors activity locally.

---

## Lab Environment

This environment provides:

- A single-node Kubernetes cluster (kubeadm-based)
- `kubectl` already configured
- Internet access to pull container images and manifests

You will deploy Falco directly from the official GitHub repository.

---

## What You Will Learn

By the end of this lab, you will understand:

- How to deploy Falco using an official Kubernetes manifest
- How Falco detects suspicious container behavior
- How to read and interpret Falco alerts
- Where Falco rules are defined and how they work

---

Proceed to the next step:

➡ **Deploy Falco Using the Official Manifest**