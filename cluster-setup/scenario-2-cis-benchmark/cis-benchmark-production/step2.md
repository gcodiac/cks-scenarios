# Step 2 – Automate review and exceptions

In a real environment, run the pinned benchmark image on a schedule with read-only access, export results to a protected store, and alert on regressions. Keep the image digest and benchmark profile in source control.

Use an exception record when a control is not applicable or cannot yet be remediated. It must include the control ID, rationale, compensating control, risk owner, expiry date, and approval. Re-test after every Kubernetes upgrade and infrastructure change.

For this lab, verify that a benchmark report can be produced and that the cluster remains healthy. Then inspect your record for version, scope, evidence, owner, and expiry fields before finishing.
