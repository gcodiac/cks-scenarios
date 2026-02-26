# Create main course directory
#mkdir -p cks-course
#cd cks-course

# Create main course files
touch course.json

# Create Cluster Setup scenarios (15%)
mkdir -p cluster-setup/scenario-1-rbac/{assets,scripts}
mkdir -p cluster-setup/scenario-2-network-policies/{assets,scripts}
mkdir -p cluster-setup/scenario-3-security-contexts/{assets,scripts}

# Create scenario files for Cluster Setup
for scenario in scenario-1-rbac scenario-2-network-policies scenario-3-security-contexts; do
    touch cluster-setup/$scenario/index.json
    touch cluster-setup/$scenario/intro.md
    touch cluster-setup/$scenario/step1.md
    touch cluster-setup/$scenario/step2.md
    touch cluster-setup/$scenario/finish.md
    touch cluster-setup/$scenario/scripts/setup.sh
    touch cluster-setup/$scenario/scripts/verify.sh
done

# Create Cluster Hardening scenarios (15%)
mkdir -p cluster-hardening/scenario-1-api-server-hardening/{assets,scripts}
mkdir -p cluster-hardening/scenario-2-node-hardening/{assets,scripts}
mkdir -p cluster-hardening/scenario-3-etcd-encryption/{assets,scripts}

# Create scenario files for Cluster Hardening
for scenario in scenario-1-api-server-hardening scenario-2-node-hardening scenario-3-etcd-encryption; do
    touch cluster-hardening/$scenario/index.json
    touch cluster-hardening/$scenario/intro.md
    touch cluster-hardening/$scenario/step1.md
    touch cluster-hardening/$scenario/step2.md
    touch cluster-hardening/$scenario/finish.md
    touch cluster-hardening/$scenario/scripts/setup.sh
    touch cluster-hardening/$scenario/scripts/verify.sh
done

# Create System Hardening scenarios (10%)
mkdir -p system-hardening/scenario-1-kernel-hardening/{assets,scripts}
mkdir -p system-hardening/scenario-2-apparmor-seccomp/{assets,scripts}

# Create scenario files for System Hardening
for scenario in scenario-1-kernel-hardening scenario-2-apparmor-seccomp; do
    touch system-hardening/$scenario/index.json
    touch system-hardening/$scenario/intro.md
    touch system-hardening/$scenario/step1.md
    touch system-hardening/$scenario/step2.md
    touch system-hardening/$scenario/finish.md
    touch system-hardening/$scenario/scripts/setup.sh
    touch system-hardening/$scenario/scripts/verify.sh
done

# Create Microservice Vulnerabilities scenarios (20%)
mkdir -p microservice-vulnerabilities/scenario-1-pod-security-standards/{assets,scripts}
mkdir -p microservice-vulnerabilities/scenario-2-admission-controllers/{assets,scripts}
mkdir -p microservice-vulnerabilities/scenario-3-secrets-management/{assets,scripts}
mkdir -p microservice-vulnerabilities/scenario-4-container-security/{assets,scripts}

# Create scenario files for Microservice Vulnerabilities
for scenario in scenario-1-pod-security-standards scenario-2-admission-controllers scenario-3-secrets-management scenario-4-container-security; do
    touch microservice-vulnerabilities/$scenario/index.json
    touch microservice-vulnerabilities/$scenario/intro.md
    touch microservice-vulnerabilities/$scenario/step1.md
    touch microservice-vulnerabilities/$scenario/step2.md
    touch microservice-vulnerabilities/$scenario/step3.md
    touch microservice-vulnerabilities/$scenario/finish.md
    touch microservice-vulnerabilities/$scenario/scripts/setup.sh
    touch microservice-vulnerabilities/$scenario/scripts/verify.sh
done

# Create Supply Chain Security scenarios (20%)
mkdir -p supply-chain-security/scenario-1-image-scanning/{assets,scripts}
mkdir -p supply-chain-security/scenario-2-signed-images/{assets,scripts}
mkdir -p supply-chain-security/scenario-3-opa-gatekeeper/{assets,scripts}
mkdir -p supply-chain-security/scenario-4-binary-authorization/{assets,scripts}

# Create scenario files for Supply Chain Security
for scenario in scenario-1-image-scanning scenario-2-signed-images scenario-3-opa-gatekeeper scenario-4-binary-authorization; do
    touch supply-chain-security/$scenario/index.json
    touch supply-chain-security/$scenario/intro.md
    touch supply-chain-security/$scenario/step1.md
    touch supply-chain-security/$scenario/step2.md
    touch supply-chain-security/$scenario/step3.md
    touch supply-chain-security/$scenario/finish.md
    touch supply-chain-security/$scenario/scripts/setup.sh
    touch supply-chain-security/$scenario/scripts/verify.sh
done

# Create Monitoring, Logging and Runtime Security scenarios (20%)
mkdir -p monitoring-logging-runtime/scenario-1-falco-runtime/{assets,scripts}
mkdir -p monitoring-logging-runtime/scenario-2-audit-logging/{assets,scripts}
mkdir -p monitoring-logging-runtime/scenario-3-anomaly-detection/{assets,scripts}
mkdir -p monitoring-logging-runtime/scenario-4-incident-response/{assets,scripts}

# Create scenario files for Monitoring, Logging and Runtime Security
for scenario in scenario-1-falco-runtime scenario-2-audit-logging scenario-3-anomaly-detection scenario-4-incident-response; do
    touch monitoring-logging-runtime/$scenario/index.json
    touch monitoring-logging-runtime/$scenario/intro.md
    touch monitoring-logging-runtime/$scenario/step1.md
    touch monitoring-logging-runtime/$scenario/step2.md
    touch monitoring-logging-runtime/$scenario/step3.md
    touch monitoring-logging-runtime/$scenario/finish.md
    touch monitoring-logging-runtime/$scenario/scripts/setup.sh
    touch monitoring-logging-runtime/$scenario/scripts/verify.sh
done

# Make scripts executable
find . -name "*.sh" -type f -exec chmod +x {} \;

echo "CKS Course structure created successfully!"
echo "Total scenarios: 21"
echo "Directory structure:"
tree -I 'node_modules'