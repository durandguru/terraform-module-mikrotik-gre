# Terraform Module for RouterOS GRE IPv4/v6 Tunnels

## Purpose
This module let perform the following:
- Create GRE IPv4 and/or IPv6 Tunnel
- Create an IPv4 and/or IPv6 address on the tunnel
- Create an IPv4 and/or IPv6 route to an network

### Calling the module:
```terraform
module "terraform-module-mikrotik-gre" {
  source = "github.com/durandguru/terraform-module-mikrotik-gre"

  gretunnels = var.gretunnels
}
```

### Define an IPv4 Tunnel
IPv4 is used for the tunnel transport. You can use IPv4 and/or IPv6 over the tunnel. See the variables.tf for the variables available.
```terraform
gretunnels = {
  grev4-name = {
    type                   = "ipv4"
    name                   = "GREv4-x-to-y"
    allow_fast_path        = false
    comment                = "GREv4 Tunnel from x to y"
    ipsec_secret           = "password"
    local_address          = "10.1.1.1"
    remote_address         = "10.2.1.1"
    disabled               = false
    ipv4_address           = "10.255.255.109/30"
    ipv4_route_gateway     = "10.255.255.110"
    ipv4_route_distance    = "10"
    ipv4_route_dst_address = "10.10.0.0/16"
  }
}
```

### Define an IPv6 Tunnel
IPv6 is used for the tunnel transport. You can use IPv4 and/or IPv6 over the tunnel. See the variables.tf for the variables available.
```terraform
gretunnels = {
  grev6-name = {
    type                   = "ipv6"
    name                   = "GREv6-x-to-y"
    allow_fast_path        = false
    comment                = "GREv6 Tunnel from x to y"
    ipsec_secret           = "password"
    # local_address          = "2001:0DB8::1"
    remote_address         = "2001:0DB8::2"
    disabled               = true
  }
}
```

### Versions Tested
- RouterOS 7.18.2
- Provider 1.85.2

### Known Bugs:
- IPv6 validation broken on routeros_interface_gre6 / local_address in 1.85.2
- routeros_ipv6_address / auto_link_local disabled