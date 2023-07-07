locals {
  _server_size_type_map = {
    extra-small = "cx11"
    small       = "cx21"
    medium      = "cx31"
    large       = "cx41"
    extra-large = "cx51"
  }
  server_type = local._server_size_type_map[var.size]

  ssh_keys = var.ssh_key_name == "" ? [hcloud_ssh_key.default[0].id] : [var.ssh_key_name]

}
