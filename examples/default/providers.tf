terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.41.0"
    }
    local = {
      source = "hashicorp/local"
      version = "2.4.0"
    }
  }
}
