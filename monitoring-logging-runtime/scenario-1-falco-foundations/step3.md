# Step 3 – Explore Rules, Cleanup and Summary

🚧 This step is under construction.

In this step, you will later:

- Explore Falco rule definitions
- Inspect Falco configuration
- Clean up deployed resources
- Review key takeaways

Proceed to Finish.




# Step 3 – Exam Context and Rule Management

Before modifying rules, it’s important to understand how Falco would realistically appear in a Kubernetes security exam environment ( speculations ).

---

## 1️⃣ Is Falco Installed with Helm in an Exam?

CKS do **not** test Helm-based Falco deployment however in CKA you probably did some helm installations.

However:

- The CKS exam environment uses **kubeadm-based clusters**
- Security tooling may already be installed
- Falco (if present) would likely already be running

You are more likely to be asked to:

- Investigate alerts
- Modify configurations
- Validate runtime policies
- Tune rules
- Work with existing deployments

You are very unlikely to be asked to:

- Install Falco from Helm
- Add Helm repositories
- Perform full production-style deployments

Helm installation in this lab is useful for realism, but exam-style tasks focus on:

- Inspecting
- Modifying
- Validating
- Troubleshooting

---

## 2️⃣ In a kubeadm-Based Cluster, How Is Falco Typically Deployed?

Common deployment methods:

| Method            | Common in Real Clusters | Likely in Exam Context |
|-------------------|--------------------------|-------------------------|
| Helm              | Yes (most common)        | Possibly pre-installed  |
| Raw YAML          | Sometimes                | Possible                |
| Binary on host    | Rare in K8s clusters     | Very unlikely           |
| Systemd service   | Host-level Falco         | Unlikely in K8s exam    |

For an exam-style simulation, assume:

- Falco is already running as a **DaemonSet**
- Your task is to **inspect or adjust it**

---

## 3️⃣ How Are Rules Normally Modified?

This is where realistic security tasks begin.

With Helm-based deployment, Falco rules usually come from:

- `/etc/falco/falco_rules.yaml`
- `/etc/falco/falco_rules.local.yaml`
- ConfigMaps mounted into the Falco pod

In Kubernetes, rules are commonly stored in ConfigMaps:

```bash
kubectl get configmaps -n falco
````

You will typically see entries such as:

* `falco`
* `falco-rules`
* `falcoctl-config`

In an exam-style task, you are more likely to:

* Add a new rule
* Modify a rule priority
* Disable a noisy rule
* Enable or adjust output configuration
* Restart Falco
* Validate that a rule is triggered

You are very unlikely to:

* Exec into a container and edit files directly

A realistic workflow looks like this:

1. Edit the relevant ConfigMap
2. Apply the changes
3. Restart the DaemonSet
4. Trigger activity
5. Verify the alert behavior

---

## 4️⃣ What Should an Exam-Style Task Look Like?

Instead of casually exploring rules, an exam-style task would be specific and measurable.

Examples:

* Modify Falco so that spawning a shell inside a container generates a **Warning** instead of **Notice**
* Create a custom rule that detects execution of `nc` (netcat) inside containers
* Disable the rule **"Terminal shell in container"**

These tasks require you to:

* Inspect the ConfigMap
* Edit rule definitions
* Restart Falco
* Trigger an event
* Confirm the behavior change

This closely reflects real operational security work.

---

## 5️⃣ Recommended Structure for This Scenario

To align with exam realism:

* **Step 1** – Deploy Falco (environment preparation)
* **Step 2** – Trigger alerts (understand detections)
* **Step 3** – Modify an existing rule priority
* **Step 4 (Advanced)** – Create a custom rule and verify it fires

This progression mirrors how security engineers actually work with runtime detection tools.

---

## 6️⃣ Important Reality Check

CKS focuses primarily on:

* AppArmor
* Seccomp
* NetworkPolicies
* Pod Security Standards
* Admission controllers

Falco aligns with runtime security concepts but is not a core installation requirement in the exam.

This lab strengthens:

* Runtime security awareness
* Detection engineering mindset
* Operational debugging skills

But do not expect Helm-based Falco installation tasks in an actual certification exam.

```
```

