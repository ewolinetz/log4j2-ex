# log4j2-ex

Example app that uses https://github.com/ewolinetz/log4j2-ex-src to create log messages every 1 second.

It also takes from https://github.com/knrc/openshift-examples/tree/json-logging-eap6/json-logging-eap6 in configuring
the registry.access.redhat.com/jboss-eap-6/eap64-openshift image to run using the OPENSHIFT log formatter.


## Usage with OpenShift
With the repo cloned: `oc new-app -f log4j2-ex/hack/dev-build.yaml`
This template will create your IS, BC, and a template for your DC to run this application.

The builds should begin automatically and you can watch them with `oc get builds -w`.

After they have completed you can create your DC with `oc new-app log4j2-ex-template`.

You should see your pods scheduled shortly after that!
