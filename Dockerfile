FROM ubuntu:latest

RUN apk add --no-cache bash

COPY increment_script.sh /increment_script.sh

RUN chmod +x /increment_script.sh

ENTRYPOINT ["/increment_script.sh"]