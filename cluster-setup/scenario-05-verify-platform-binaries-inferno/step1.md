# Verify Platform Binaries — Inferno

## Inferno task: verify the trust chain

A tool has the expected version but was copied into the node outside the package manager. Investigate before replacing it.

1. Resolve the real path and inspect symlinks.
2. Check ownership, mode, extended attributes, package ownership, and process paths.
3. Obtain the official checksum for the exact Kubernetes release and architecture over a trusted channel.
4. Compare hashes byte-for-byte and quarantine a mismatch rather than deleting evidence.
5. Check static pod image references and digests as well as host binaries.

~~~bash
readlink -f "$(command -v kubectl)"
stat "$(command -v kubectl)"
sha256sum "$(command -v kubectl)"
ps auxww | grep -E 'kube-(apiserver|scheduler|controller-manager)' | grep -v grep
sudo grep -R 'image:' /etc/kubernetes/manifests
~~~

A version match is not enough. Explain your source of trust and retain command output as evidence.
