# Find image details.
data "hcloud_image" "default" {
  with_architecture = "x86"
  name              = var.image
}

# Upload an SSH key.
resource "hcloud_ssh_key" "default" {
  count      = var.ssh_key_name == "" ? 1 : 0
  name       = var.name
  public_key = file("~/.ssh/id_rsa.pub")
}

# Create the server.
resource "hcloud_server" "default" {
  name        = var.name
  image       = data.hcloud_image.default.id
  server_type = local.server_type
  ssh_keys    = local.ssh_keys
  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
}

# Optionally create specified volumes.
resource "hcloud_volume" "default" {
  count     = length(var.volumes)
  name      = var.volumes[count.index].name
  size      = var.volumes[count.index].size
  server_id = hcloud_server.default.id
}

/* # Optionally attach volumes to server.
resource "hcloud_volume_attachment" "default" {
  count     = length(var.volumes)
  volume_id = hcloud_volume.default[count.index].id
  server_id = hcloud_server.default.id
  automount = false
} */
