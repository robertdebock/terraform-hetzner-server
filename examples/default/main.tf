resource "hcloud_ssh_key" "robert" {
  name       = "robert"
  public_key = file("~/.ssh/id_rsa.pub")
}

module "hetzner" {
  name         = "cloudtop"
  source       = "../../"
  size         = "medium"
  ssh_key_name = "robert"
  volumes = [
    {
      name = "data"
      size = 32
    }
  ]
}

output "hcloud_server_ipv4_address" {
  value = module.hetzner[*].hcloud_server_ipv4_address
}
