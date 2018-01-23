FROM escape:v{{{from_version}}}

RUN apt-get update && \
    apt-get install -y npm && \
    npm install -g n && \
    n stable && \
    ln -sf /usr/local/n/versions/node/*/bin/node /usr/bin/node && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
