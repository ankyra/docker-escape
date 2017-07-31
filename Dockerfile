FROM debian:8.8

RUN apt-get update && \
    apt-get install -y ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY deps/_/escape-client/escape /usr/bin/escape

ENTRYPOINT ["/usr/bin/escape"]
