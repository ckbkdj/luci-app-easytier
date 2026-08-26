# EasyTier Version Configuration
# Single source of truth used by OpenWrt package Makefiles.

# EasyTier core/application version.
EASYTIER_VERSION=2.6.4

# LuCI translation packages use PKG_PO_VERSION rather than PKG_VERSION.
# 26.238 = 2026 day 238 (2026-08-26). Keep this newer than the previous
# 26.237 netfix package while allowing later LuCI daily revisions to supersede it.
EASYTIER_LUCI_PO_VERSION=26.238.86399~netfix1

# Cross-platform EasyTier release containing both the IPv6 UDP/WG reply-source
# fix and the mobile exit-node routing fix.
EASYTIER_RELEASE_REPO=ckbkdj/EasyTier
EASYTIER_RELEASE_TAG=v2.6.4-netfix.1
