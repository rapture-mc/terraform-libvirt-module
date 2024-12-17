variable "os_img_url" {
  description = "URL to the OS image"
  type        = string
  default     = "/var/lib/libvirt/images/nixos.qcow2"
}

variable "dhcp" {
  description = "Use DHCP or Static IP settings"
  type        = bool
  default     = true
}

variable "bridge" {
  description = "Bridge interface"
  type        = string
  default     = "br0"
}

variable "base_volume_name" {
  description = "Name of base OS image"
  type        = string
  default     = null
}

variable "base_pool_name" {
  description = "Name of base OS image"
  type        = string
  default     = null
}

variable "additional_disk_ids" {
  description = "List of volume ids"
  type        = list(string)
  default     = []
}

variable "autostart" {
  description = "Autostart the domain"
  type        = bool
  default     = true
}

variable "uefi_enabled" {
  description = "Whether to use UEFI"
  type        = bool
  default     = true
}

variable "firmware" {
  description = "Path to the OVMF firmware file for UEFI"
  type        = string
  default     = "/run/libvirt/nix-ovmf/OVMF_CODE.fd"
}

variable "vm_count" {
  description = "Number of VMs"
  type        = number
  default     = 1
}

variable "running" {
  description = "Whether the machine is running"
  type        = bool
  default     = true
}

variable "index_start" {
  description = "From where the indexing start"
  type        = number
  default     = 1
}

variable "vm_hostname_prefix" {
  description = "VM hostname prefix"
  type        = string
  default     = "vm"
}

variable "memory" {
  description = "RAM in MB"
  type        = string
  default     = "1024"
}

variable "cpu_mode" {
  description = "CPU mode"
  type        = string
  default     = "host-passthrough"
}

variable "xml_override" {
  description = "With these variables you can: Enable hugepages; Set USB controllers; Attach USB devices"
  type = object({
    hugepages = bool
    usb_controllers = list(object({
      model = string
    }))
    usb_devices = list(object({
      vendor  = string
      product = string
    }))
  })
  default = {

    hugepages = false,

    usb_controllers = [
      {
        model = "piix3-uhci"
      }
    ],

    usb_devices = [
      # {
      #   vendor = "0x0123",
      #   product = "0xabcd"
      # }
    ]
  }

}

variable "vcpu" {
  description = "Number of vCPUs"
  type        = number
  default     = 1
}

variable "pool" {
  description = "Storage pool name"
  type        = string
  default     = "default"
}

variable "system_volume" {
  description = "System Volume size (GB)"
  type        = number
  default     = 10
}

variable "share_filesystem" {
  type = object({
    source   = string
    target   = string
    readonly = bool
    mode     = string
  })
  default = {
    source   = null
    target   = null
    readonly = false
    mode     = null
  }
}
