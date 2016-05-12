FROM jboss/wildfly
RUN chmod -R og+rw /opt/jboss/wildfly/standalone
ADD log4j2-ex.war /opt/jboss/wildfly/standalone/deployments
