variable "name" {
  description = "The name of the server."
  type        = string
  default     = "node1"
}

variable "image" {
  description = "The image to use for the server."
  type        = string
  default     = "ubuntu-22.04"
  validation {
    condition     = contains(["alma-8", "alma-9", "centos-7", "centos-stream-8", "centos-stream-9", "collab-tools", "debian-10", "debian-11", "debian-12", "docker-ce", "fedora-38", "fedora-39", "gitlab", "go", "jitsi", "lamp", "nextcloud", "photoprism", "prometheus-grafana", "rocky-8", "rocky-9", "ruby", "rustdesk", "ubuntu-20.04", "ubuntu-22.04", "wireguard", "wordpress"], var.image)
    error_message = "Image ${var.image} not found."
  }
}

variable "size" {
  description = "The size of the server."
  type        = string
  default     = "small"
  validation {
    condition     = contains(["extra-small", "small", "medium", "large", "extra-large"], var.size)
    error_message = "Size ${var.size} not valid, please choose: \"extra-small\", \"small\", \"medium\", \"large\" or \"extra-large\"."
  }
}

variable "ssh_key_name" {
  description = "The name of (an existing) SSH key hosted on Hetzner Cloud."
  type        = string
  default     = ""
}

variable "volumes" {
  description = "A list of volumes and their size to attach to the server."
  type        = list(object({
    name = string
    size = number
  }))
  default     = []
}
