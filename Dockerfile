FROM registry.access.redhat.com/jboss-eap-6/eap64-openshift

RUN sed -i 's/named-formatter name="COLOR-PATTERN"/named-formatter name="OPENSHIFT"/' /opt/eap/standalone/configuration/standalone-openshift.xml

ADD log4j2-ex.war /opt/eap/standalone/deployments
