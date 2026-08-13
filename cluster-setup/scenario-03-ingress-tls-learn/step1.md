# Use Ingress and Egress Rules to Restrict Network Access with TLS — Learn

## The idea

Ingress is the front door into cluster services. TLS proves the identity of that front door and encrypts traffic between the client and the TLS termination point. An Ingress object is only a routing declaration; an Ingress controller must implement it.

Egress is the controlled exit from workloads. Think of ingress as the reception desk and egress as the loading dock: both need an explicit policy.

Read the [Ingress documentation](https://kubernetes.io/docs/concepts/services-networking/ingress/) and [TLS Secret guide](https://kubernetes.io/docs/concepts/configuration/secret/#tls-secrets).

~~~bash
openssl req -x509 -nodes -newkey rsa:2048 -days 1 -keyout /tmp/lab.key -out /tmp/lab.crt -subj '/CN=demo.example.test'
kubectl create secret tls demo-tls -n cks-ingress --cert=/tmp/lab.crt --key=/tmp/lab.key --dry-run=client -o yaml
kubectl explain ingress.spec
~~~

This stage is exploratory; no validation of your commands is required.
