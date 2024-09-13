locals {
  _server_size_type_map = {
    extra-small = "cpx11"
    small       = "cpx21"
    medium      = "cpx31"
    large       = "cpx41"
    extra-large = "cpx51"
  }
  server_type = local._server_size_type_map[var.size]

  ssh_keys = var.ssh_key_name == "" ? [hcloud_ssh_key.default[0].id] : [var.ssh_key_name]

}
