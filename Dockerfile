FROM openjdk:8-jre
MAINTAINER Wolfgang Brauneis

USER root
ADD ./scripting /root/scripting
RUN cd /root/scripting && wget https://github.com/rburgst/nexus-addscript/releases/download/v1.0.0/nexus-addscript-1.0.0.jar && mv nexus-addscript-*.jar nexus-addscript.jar