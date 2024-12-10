output "hcloud_server_ipv4_address" {
  description = "The public IPv4 address of the server."
  value       = hcloud_server.default.ipv4_address
}

output "hcloud_server_name" {
  description = "The name of the created server."
  value       = hcloud_server.default.name
}
