# Learn check-in

Explain in your own words:

1. What boundary does this control protect?
2. What is the insecure default or common mistake?
3. Which command, file, object, or log would prove the control is active?

Keep this answer as notes for the Required lab. No command validation is required in this learning stage.


## Self-check with help available

Answer these before moving on:

- What is the protected asset and its trust boundary?
- Which component actually enforces **Restrict access to the Kubernetes API**?
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
