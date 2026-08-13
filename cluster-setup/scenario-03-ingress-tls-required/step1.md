# Use Ingress and Egress Rules to Restrict Network Access with TLS — Required

## Exam task

Create an Ingress for service web in namespace cks-ingress:

- Host: demo.example.test.
- TLS secret: demo-tls.
- Route / to service web on port 80.
- Redirect or reject clear-text HTTP according to the controller available.
- Do not expose the service as NodePort or LoadBalancer.

Generate a short-lived lab certificate if needed:

~~~bash
openssl req -x509 -nodes -newkey rsa:2048 -days 1 -keyout /tmp/demo.key -out /tmp/demo.crt -subj '/CN=demo.example.test'
kubectl create secret tls demo-tls -n cks-ingress --cert=/tmp/demo.crt --key=/tmp/demo.key
~~~

Verify the Ingress spec, Secret type, backend service, and namespace. Controller-specific annotations must be justified.
