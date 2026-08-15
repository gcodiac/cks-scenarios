# Verification and handoff — Use CIS Benchmarks to Review Security Configuration

## Evidence checklist

- [ ] The final state is scoped to the requested namespace, object, node, or host.
- [ ] The security control is active at the real enforcement point.
- [ ] A positive test demonstrates the intended behavior.
- [ ] A negative, boundary, or least-privilege test demonstrates that the control is not overly broad.
- [ ] Logs, Events, status, or command output are sufficient for another operator to reproduce the result.
- [ ] You can explain rollback or recovery without destroying evidence.

<details>
<summary>Show a model answer</summary>

**Baseline:** captured the relevant object and observed symptom.  
**Diagnosis:** identified the mismatch at the enforcing boundary.  
**Remediation:** changed only the requested field or file.  
**Verification:** ran a positive test and a nearby negative or boundary test.  
**Handoff:** recorded the final command output, remaining caveats, and rollback path.
</details>

Write a three-line handoff: what was wrong, what changed, and what proves it is secure now.
