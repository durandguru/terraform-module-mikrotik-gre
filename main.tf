resource "routeros_interface_gre" "tunnel" {
  for_each = {
    for k, v in var.gretunnels : k => v
    if v.type == "ipv4"
  }
  name            = each.value.name
  allow_fast_path = each.value.allow_fast_path
  clamp_tcp_mss   = each.value.clamp_tcp_mss
  comment         = each.value.comment
  disabled        = each.value.disabled
  dont_fragment   = each.value.dont_fragment
  dscp            = each.value.dscp
  ipsec_secret    = each.value.ipsec_secret
  keepalive       = each.value.keepalive
  local_address   = each.value.local_address
  mtu             = each.value.mtu
  remote_address  = each.value.remote_address
}

resource "routeros_interface_gre6" "tunnel" {
  for_each = {
    for k, v in var.gretunnels : k => v
    if v.type == "ipv6"
  }
  name           = each.value.name
  clamp_tcp_mss  = each.value.clamp_tcp_mss
  comment        = each.value.comment
  disabled       = each.value.disabled
  dscp           = each.value.dscp
  ipsec_secret   = each.value.ipsec_secret
  keepalive      = each.value.keepalive
  local_address  = each.value.local_address
  mtu            = each.value.mtu
  remote_address = each.value.remote_address
}

resource "routeros_ip_address" "ipv4_address" {
  for_each = {
    for k, v in var.gretunnels : k => v
    if v.ipv4_address != null
  }
  address   = each.value.ipv4_address
  interface = each.value.name
  comment   = "IPv4 Address for ${each.value.comment}"
  disabled  = each.value.disabled
}

resource "routeros_ipv6_address" "ipv6_address" {
  for_each = {
    for k, v in var.gretunnels : k => v
    if v.ipv6_address != null
  }
  interface = each.value.name
  address   = each.value.ipv6_address
  advertise = each.value.ipv6_advertise
  # auto_link_local = each.value.ipv6_auto_link_local
  comment   = "IPv6 Address for ${each.value.comment}"
  disabled  = each.value.disabled
  eui_64    = each.value.ipv6_eui_64
  from_pool = each.value.ipv6_from_pool
  no_dad    = each.value.ipv6_no_dad
}

resource "routeros_ip_route" "ipv4_route" {
  for_each = {
    for k, v in var.gretunnels : k => v
    if v.ipv4_route_gateway != null
  }
  gateway             = each.value.ipv4_route_gateway
  blackhole           = each.value.ipv4_route_blackhole
  check_gateway       = each.value.ipv4_route_check_gateway
  comment             = "IPv4 Route for ${each.value.comment}"
  disabled            = each.value.disabled
  distance            = each.value.ipv4_route_distance
  dst_address         = each.value.ipv4_route_dst_address
  pref_src            = each.value.ipv4_route_pref_src
  routing_table       = each.value.ipv4_route_routing_table
  scope               = each.value.ipv4_route_scope
  suppress_hw_offload = each.value.ipv4_route_suppress_hw_offload
  target_scope        = each.value.ipv4_route_target_scope
  vrf_interface       = each.value.ipv4_route_vrf_interface
}

resource "routeros_ipv6_route" "ipv6_route" {
  for_each = {
    for k, v in var.gretunnels : k => v
    if v.ipv6_route_gateway != null
  }
  dst_address         = each.value.ipv6_route_dst_address
  gateway             = each.value.ipv6_route_gateway
  blackhole           = each.value.ipv6_route_blackhole
  check_gateway       = each.value.ipv6_route_check_gateway
  comment             = "IPv6 Route for ${each.value.comment}"
  disabled            = each.value.disabled
  distance            = each.value.ipv6_route_distance
  pref_src            = each.value.ipv6_route_pref_src
  routing_table       = each.value.ipv6_route_routing_table
  scope               = each.value.ipv6_route_scope
  suppress_hw_offload = each.value.ipv6_route_suppress_hw_offload
  target_scope        = each.value.ipv6_route_target_scope
  vrf_interface       = each.value.ipv6_route_vrf_interface
}