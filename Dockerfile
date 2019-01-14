FROM jenkins/jenkins:2.71-alpine

ENV JENKINS_REF /usr/share/jenkins/ref

# install jenkins plugins
#COPY plugins.txt $JENKINS_REF/
#RUN /usr/local/bin/plugins.sh $JENKINS_REF/plugins.txt

ENV JAVA_OPTS -Dorg.eclipse.jetty.server.Request.maxFormContentSize=100000000 \
 			  -Dorg.apache.commons.jelly.tags.fmt.timeZone=America/Los_Angeles \
 			  -Dhudson.diyChunking=false \
 			  -Djenkins.install.runSetupWizard=true

# copy scripts and ressource files
COPY *.* $JENKINS_REF/
# COPY jobs $JENKINS_REF/jobs/
COPY init.groovy.d $JENKINS_REF/init.groovy.d/
# COPY dsl $JENKINS_REF/dsl/
