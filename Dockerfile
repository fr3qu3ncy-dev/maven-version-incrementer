FROM maven:3.8.3-openjdk-17

ENV JAVA_HOME=/usr/java/openjdk-17

COPY increment_script.sh /increment_script.sh

RUN chmod +x /increment_script.sh

ENTRYPOINT ["/increment_script.sh"]