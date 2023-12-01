# bw-docker

This is a docker image for using [Bitwarden](https://bitwarden.com) with [External-Secrets](https://external-secrets.io) for kubernetes clusters.

## Usage

Please check: [https://external-secrets.io/latest/examples/bitwarden/](https://external-secrets.io/latest/examples/bitwarden/) for full example with kubernetes manifests.

### Environment Variables

| Variable          | Description                       | Default | Required |
| ----------------- | --------------------------------- | ------- | -------- |
| `BW_HOST`         | leave empty for bitwarden.com     | ``      | no       |
| `BW_CLIENTID`     | required to login with an API key | ``      | yes      |
| `BW_CLIENTSECRET` | required to login with an API key | ``      | yes      |
| `BW_PASSWORD`     | required to decrypt the vault     | ``      | yes      |
