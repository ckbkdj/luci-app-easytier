# EasyTier Version Configuration
# This file is the single source of truth for the EasyTier version and release source.
# Used by: easytier/Makefile, easytier-noweb/Makefile, luci-app-easytier/Makefile

EASYTIER_VERSION=2.6.4
EASYTIER_RELEASE_REPO=EasyTier/EasyTier
EASYTIER_RELEASE_TAG=v2.6.4

# OpenWrt aarch64 compatibility build. The patched core preserves the IPv6
# destination address as the source address for UDP/WireGuard listener replies.
EASYTIER_OPENWRT_AARCH64_FIX_REPO=ckbkdj/EasyTier
EASYTIER_OPENWRT_AARCH64_FIX_TAG=v2.6.4-openwrt-ipv6fix.1
