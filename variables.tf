variable "gretunnels" {
  type = map(object({
    type                           = string
    name                           = string
    allow_fast_path                = optional(bool)
    clamp_tcp_mss                  = optional(bool)
    comment                        = string
    disabled                       = optional(bool)
    dont_fragment                  = optional(string)
    dscp                           = optional(string)
    ipsec_secret                   = optional(string)
    keepalive                      = optional(string)
    local_address                  = optional(string)
    mtu                            = optional(string)
    remote_address                 = string
    ipv4_address                   = optional(string)
    ipv4_route_gateway             = optional(string)
    ipv4_route_blackhole           = optional(bool)
    ipv4_route_check_gateway       = optional(string)
    ipv4_route_distance            = optional(string)
    ipv4_route_dst_address         = optional(string)
    ipv4_route_pref_src            = optional(string)
    ipv4_route_routing_table       = optional(string)
    ipv4_route_scope               = optional(string)
    ipv4_route_suppress_hw_offload = optional(bool)
    ipv4_route_target_scope        = optional(string)
    ipv4_route_vrf_interface       = optional(string)
    ipv6_address                   = optional(string)
    ipv6_advertise                 = optional(bool, false)
    ipv6_auto_link_local           = optional(bool, true)
    ipv6_eui_64                    = optional(bool, false)
    ipv6_from_pool                 = optional(string)
    ipv6_no_dad                    = optional(bool, false)
    ipv6_route_dst_address         = optional(string)
    ipv6_route_gateway             = optional(string)
    ipv6_route_blackhole           = optional(bool)
    ipv6_route_check_gateway       = optional(string)
    ipv6_route_distance            = optional(string)
    ipv6_route_pref_src            = optional(string)
    ipv6_route_routing_table       = optional(string)
    ipv6_route_scope               = optional(string)
    ipv6_route_suppress_hw_offload = optional(bool)
    ipv6_route_target_scope        = optional(string)
    ipv6_route_vrf_interface       = optional(string)
  }))
  default = {
  }
}