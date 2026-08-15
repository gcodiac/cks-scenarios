# Exam review

Before finishing, check the exact task:

- Did you change only the requested scope?
- Can you show final state with a command rather than an assumption?
- Did you preserve availability and avoid adding a broad exception?

Write the verification commands you would use in a timed exam.


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
