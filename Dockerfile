FROM jboss/wildfly
ADD log4j2-ex.war /opt/jboss/wildfly/standalone/deployments
