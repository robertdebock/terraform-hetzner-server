# Hetzner Cloud server

This Terraform module allows you to spin up a server on Hetzner Cloud.

These variables are supported

| variable | default        |
|----------|----------------|
| `name`   | `node1`        |
| `size`   | `small`        |
| `image`  | `ubuntu-22.04` |

## Name

Pick a name for the machine, like "myserver". Defaults to **"node1"**.

## Size

Pick a size for the machine. Defaults to **"small"**.

The size can be any of these:

| Size name     | CPU | Memory (GB) | Disk |
|---------------|-----|-------------|------|
| "extra-small" | 1   | 2           | 20   |
| **"small"**   | 2   | 4           | 40   |
| "medium"      | 2   | 8           | 80   |
| "large"       | 4   | 16          | 160  |
| "extra-large" | 8   | 32          | 240  |

## Image

Pick an image for the machine. Defaults to **"ubuntu-22.04"**.

The image can be any of these:

- "alma-8"
- "alma-9"
- "centos-stream-8"
- "centos-stream-9"
- "collab-tools"
- "debian-10"
- "debian-11"
- "debian-12"
- "docker-ce"
- "fedora-37"
- "fedora-38"
- "gitlab"
- "go"
- "jitsi"
- "lamp"
- "nextcloud"
- "photoprism"
- "prometheus-grafana"
- "rocky-8"
- "rocky-9"
- "ruby"
- "rustdesk"
- "ubuntu-20.04"
- **"ubuntu-22.04"**
- "wireguard"
- "wordpress"
