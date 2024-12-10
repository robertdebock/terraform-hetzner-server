# Hetzner Cloud server

This Terraform module allows you to spin up a server on Hetzner Cloud.

These variables are supported

| variable    | default        |
|-------------|----------------|
| `name`      | `node1`        |
| `size`      | `small`        |
| `image`     | `ubuntu-22.04` |
| `datacenter`| `fsn1-dc14`    |

## Name

Pick a name for the machine, like "myserver". Defaults to **"node1"**.

The name must:

- Start and end with alphanumeric characters
- Contain only alphanumeric characters, dots, or dashes

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

## Volumes

Optionally attach volumes to your server by providing a list of volume configurations. Each volume requires:

- `name`: A name for the volume
- `size`: Size in GB (must be between 10GB and 10240GB/10TB)

Example:

```hcl
volumes = [
  {
    name = "data"
    size = 100  # Creates a 100GB volume
  }
]
```

## Datacenter

Pick a datacenter for the machine. Defaults to **"fsn1-dc14"** (Falkenstein, Germany).

The datacenter can be any of these:

- "nbg1-dc3" (Nuremberg, Germany, EU Central)
- **"fsn1-dc14"** (Falkenstein, Germany, EU Central)
- "hel1-dc2" (Helsinki, Finland, EU Central)
- "ash-dc1" (Ashburn, VA, US East)
- "hil-dc1" (Hillsboro, OR, US West)
- "sgp1-dc1" (Singapore, AP Southeast)
