# EasyTier Version Configuration
# Single source of truth used by OpenWrt package Makefiles.

# EasyTier core/application version.
EASYTIER_VERSION=2.6.4

# LuCI translation packages use PKG_PO_VERSION rather than PKG_VERSION.
# Keep this LuCI-style value independent from the EasyTier core version.
# 26.237 = 2026 day 237 (2026-08-25); 86399 makes this newer than
# existing 26.136.x packages while allowing normal later-day LuCI updates
# (26.238.x and newer) to supersede it naturally.
EASYTIER_LUCI_PO_VERSION=26.237.86399~ipv6fix2

# Patched EasyTier multi-architecture release containing the IPv6 UDP/WG fix.
EASYTIER_RELEASE_REPO=ckbkdj/EasyTier
EASYTIER_RELEASE_TAG=v2.6.4-openwrt-ipv6fix.2
