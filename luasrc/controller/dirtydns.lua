-- Copyright (C) 2021 luci-app-dirtydns
-- Copyright (C) 2021 NagaseKouichi
-- Licensed to the public under the GNU General Public License v3.

module("luci.controller.dirtydns", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/dirtydns") then
		return
	end

	entry({"admin", "services", "dirtydns"}, cbi("dirtydns"), _("DirtyDNS"), 60).dependent = true
	entry({"admin", "services", "dirtydns", "status"}, call("act_status")).leaf = true
	entry({"admin", "services", "dirtydns", "refresh"}, call("refresh_data"))
end

function act_status()
	local e={}
	e.running=luci.sys.call("ps|grep -v grep|grep -c dirtydns >/dev/null")==0
	luci.http.prepare_content("application/json")
	luci.http.write_json(e)
end

function refresh_data()
	sret=luci.sys.call("/usr/share/dirtydns/dirtydns_update_ipset.sh 2>/dev/null")
	if sret== 0 then
		retstring ="0"
	else
		retstring ="-1"
	end

	luci.http.prepare_content("application/json")
	luci.http.write_json({ ret=retstring})
end

-- Fuck GFW and who made it, Freedom!