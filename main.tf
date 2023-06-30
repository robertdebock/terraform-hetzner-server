# Find image details.
data "hcloud_image" "default" {
  with_architecture = "x86"
  name              = var.image
}

# Upload an SSH key.
resource "hcloud_ssh_key" "default" {
  name       = "Terraform"
  public_key = file("~/.ssh/id_rsa.pub")
}

# Create the server.
resource "hcloud_server" "default" {
  name        = var.name
  image       = data.hcloud_image.default.id
  server_type = local.server_type
  ssh_keys    = [hcloud_ssh_key.default.id]
  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
}
