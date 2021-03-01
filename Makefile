#
# Copyright (C) 2021 luci-app-dirtydns
# Copyright (C) 2021 NagaseKouichi
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-dirtydns
PKG_VERSION:=0.1.0
PKG_RELEASE:=1

PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=NagaseKouichi

LUCI_TITLE:=LuCI support for DirtyDNS
LUCI_DESCRIPTION:=LuCI Support for DirtyDNS.
LUCI_DEPENDS:=+socat +ipset +kmod-ipt-ipset +wget
LUCI_PKGARCH:=all

include $(TOPDIR)/feeds/luci/luci.mk

define Package/dirtydns/conffiles
/etc/config/dirtydns
/etc/dirtydns/chnroute.txt
endef

# call BuildPackage - OpenWrt buildroot signature
