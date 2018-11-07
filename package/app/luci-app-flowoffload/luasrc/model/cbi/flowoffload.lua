local m,s,o
local SYS  = require "luci.sys"

m = Map("flowoffload")
m.title	= translate("Turbo ACC Acceleration Settings")
m.description = translate("Opensource Linux Flow Offload driver (Fast Path or HWNAT)")
m:append(Template("flow/status"))

s = m:section(TypedSection, "flow")
s.addremove = false
s.anonymous = true

flow = s:option(Flag, "flow_offloading", translate("Enable"))
flow.default = 0
flow.rmempty = false
flow.description = translate("Enable software flow offloading for connections. (decrease cpu load / increase routing throughput)")

dns = s:option(Flag, "dns", translate("DNS Acceleration"))
dns.default = 0
dns.rmempty = false
dns.description = translate("Enable DNS Cache Acceleration and anti ISP DNS pollution")

o = s:option(Value, "dns_server", translate("Upsteam DNS Server"))
o.default = "114.114.114.114,114.114.115.115"
o.description = translate("Muitiple DNS server can saperate with ','")
o:depends("dns", 1)

return m
