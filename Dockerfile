FROM debian:sid

LABEL org.opencontainers.image.source="https://github.com/d2checkpoint-com/bw-docker"
LABEL org.opencontainers.image.authors="Midka <me@midka.dev>"
LABEL org.opencontainers.image.title="Bitwarden CLI Docker"
LABEL org.opencontainers.image.description="This image was made for usage with external-secrets.io. https://external-secrets.io/latest/examples/bitwarden/"
LABEL org.opencontainers.image.licenses=MIT

ENV BW_CLI_VERSION=2023.10.0

RUN apt update && \
    apt install -y wget unzip && \
    wget https://github.com/bitwarden/clients/releases/download/cli-v${BW_CLI_VERSION}/bw-linux-${BW_CLI_VERSION}.zip && \
    unzip bw-linux-${BW_CLI_VERSION}.zip && \
    chmod +x bw && \
    mv bw /usr/local/bin/bw && \
    rm -rfv *.zip

COPY entrypoint.sh /

CMD ["/entrypoint.sh"]
