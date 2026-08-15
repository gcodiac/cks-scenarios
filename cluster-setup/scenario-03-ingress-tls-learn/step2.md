# What to remember

- Identify the object or host boundary that enforces this control.
- Know what a secure default looks like.
- Know which command or document gives you evidence.

No validation is required for exploratory commands. The next stage is a bounded exam task.


## Self-check with help available

Answer these before moving on:

- What is the protected asset and its trust boundary?
- Which component actually enforces **Use Ingress and Egress Rules to Restrict Network Access with TLS**?
- What is the smallest secure state you need to demonstrate?
- Which command, file, log, or functional test is authoritative evidence?

<details>
<summary>Hint</summary>

Start with the affected namespace, object, node, or process. Compare desired state with observed state, then follow labels, references, identities, ports, or parent processes until you reach the enforcement point. If the result is surprising, inspect Events and the active configuration rather than broadening permissions.
</details>

<details>
<summary>Solution pattern</summary>

A strong answer records: **baseline → diagnosis → minimal change → positive test → negative or boundary test → final evidence**. The exact command depends on the objective, but it should show the enforcing state rather than merely showing that a resource exists.
</details>
