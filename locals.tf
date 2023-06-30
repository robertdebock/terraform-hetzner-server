locals {
  _server_size_type_map = {
    extra-small = "cx11"
    small       = "cx21"
    medium      = "cx31"
    large       = "cx41"
    extra-large = "cx51"
  }
  server_type = local._server_size_type_map[var.size]
}
