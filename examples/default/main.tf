module "hetzner" {
  source = "../../"
}

output "hcloud_server_ipv4_address" {
  value = module.hetzner.hcloud_server_ipv4_address
}

resource "local_file" "inventory" {
  content  = templatefile("${path.module}/inventory.tpl", { hosts = [module.hetzner.hcloud_server_ipv4_address] })
  filename = "${path.module}/ansible/inventory/hosts"
}
