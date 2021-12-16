FROM node:14-alpine

RUN npm install -g @mockoon/cli@1.4.0
COPY mockoon-greeting-api.json ./data

# Do not run as root.
RUN adduser --shell /bin/sh --disabled-password --gecos "" mockoon
USER mockoon


EXPOSE 3000

ENTRYPOINT ["mockoon-cli", "start", "--hostname", "0.0.0.0", "--data", "data", "--daemon-off"]

# Usage: docker run -p <host_port>:<container_port> mockoon-test
