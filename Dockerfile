FROM debian:8.8

ENV CLOUD_SDK_VERSION 214.0.0
ENV PATH /google-cloud-sdk/bin:$PATH

RUN apt-get update && \
    apt-get install -y ca-certificates python jq curl python-pip git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    cd / && \
    curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    tar xzf google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    rm google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    ln -s /lib /lib64 && \
    gcloud config set core/disable_usage_reporting true && \
    gcloud config set component_manager/disable_update_check true && \
    gcloud config set metrics/environment github_docker_image

COPY deps/heist/escape-integration-tests/deps/_/escape/escape /usr/bin/escape

ENTRYPOINT ["/usr/bin/escape"]
