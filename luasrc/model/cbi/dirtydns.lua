-- Copyright (C) 2021 luci-app-dirtydns
-- Copyright (C) 2021 NagaseKouichi
-- Licensed to the public under the GNU General Public License v3.

local m, s, o


m = Map("dirtydns", translate("DirtyDNS"), translate("DirtyDNS is an DNS forwarder written in Shell script similar with ChinaDNS."))

-- m:section(SimpleSection).template  = "dirtydns/status"

s = m:section(TypedSection, "dirtydns", translate("General Setting"))
s.anonymous   = true

o = s:option(Flag, "enable", translate("Enable"))
o.rmempty     = false

o = s:option(Value, "port", translate("Listen Port"))
o.placeholder = 5353
o.default     = 5353
o.datatype    = "port"
o.rmempty     = false

o = s:option(Value, "dirty_upstream", translate("Dirty DNS Upstream"))
o.placeholder = "114.114.114.114:53"
o.default     = "114.114.114.114:53"
o.rmempty     = false

o = s:option(Value, "secured_upstream", translate("Secured DNS Upstream"))
o.placeholder = "127.0.0.1:5053"
o.default     = "127.0.0.1:5053"
o.rmempty     = false

o = s:option(Value, "ipset_dirty", translate("China Ipset Name"), translate("Dirty response will be used only if response matches China ipset"))
o.placeholder = "chnroute"
o.default     = "chnroute"
o.rmempty     = false

o = s:option(Flag, "creat_ipset", translate("Creat Ipset"), translate("If there is already an China ipset, you do not need to check this"))
o.rmempty     = false

o = s:option(Flag, "auto_update_ipset", translate("Auto Update Ipset"), translate("Auto update China ipset at 3:00 on Saturday"))
o.rmempty     = false

o=s:option(DummyValue,"dirtydns_data",translate("Update Ipset Now"))
o.rawhtml  = true
o.template = "dirtydns/refresh"
o.value = " "

return m
