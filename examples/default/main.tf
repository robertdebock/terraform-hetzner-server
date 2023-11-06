resource "hcloud_ssh_key" "robert" {
  name       = "robert"
  public_key = file("~/.ssh/id_rsa.pub")
}

module "hetzner" {
  count        = 1
  image        = local.server_image[count.index]
  name         = "cloudtop-${count.index + 1}"
  source       = "../../"
  size         = "medium"
  ssh_key_name = "robert"
  volumes = [
    {
      name = "data"
      size = 128
    },
  ]
}

output "hcloud_server_ipv4_address" {
  value = module.hetzner[*].hcloud_server_ipv4_address
}

resource "local_file" "inventory" {
  content  = templatefile("${path.module}/inventory.tpl", {
    hosts = module.hetzner[*].hcloud_server_ipv4_address
  })
  filename = "${path.module}/ansible/inventory/hosts"
}

resource "local_file" "ssh_conf_d" {
  content  = templatefile("${path.module}/ssh.conf.tpl", {
    hosts = module.hetzner[*].hcloud_server_ipv4_address
  })
  filename = pathexpand("~/.ssh/conf.d/hetzner.conf")
}
