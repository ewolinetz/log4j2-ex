FROM jboss/wildfly

RUN mkdir -p /opt/jboss/wildfly/modules/system/layers/base/org/apache/log4j2/main && \
    mkdir -p /opt/jboss/wildfly/modules/system/layers/base/com/fasterxml/jackson/core/main && \
    chmod -R og+rw /opt/jboss/wildfly/standalone && \
    sed -i 's/org.apache.log4j/org.apache.log4j2/' /opt/jboss/wildfly/modules/system/layers/base/org/jboss/as/logging/main/module.xml && \
    sed -i 's/named-formatter name="COLOR-PATTERN"/named-formatter name="OPENSHIFT"/' /opt/jboss/wildfly/standalone/configuration/standalone.xml && \
    sed -i '/<formatter name="COLOR-PATTERN">/ i \
<formatter name="OPENSHIFT"><custom-formatter module="org.apache.log4j2" class="org.apache.logging.log4j.core.layout.JsonLayout"></custom-formatter></formatter>' /opt/jboss/wildfly/standalone/configuration/standalone.xml

ADD log4j2-ex.war /opt/jboss/wildfly/standalone/deployments
ADD log4j2/* /opt/jboss/wildfly/modules/system/layers/base/org/apache/log4j2/main/
ADD jackson/* /opt/jboss/wildfly/modules/system/layers/base/com/fasterxml/jackson/core/main/
