# Load the shared EasyTier version/release source before rules.mk changes MAKEFILE_LIST.
-include $(dir $(lastword $(MAKEFILE_LIST)))../version.mk
include $(TOPDIR)/rules.mk

PKG_NAME:=easytier
PKG_VERSION:=$(or $(EASYTIER_VERSION),2.6.4)
PKG_RELEASE:=5

ifeq ($(ARCH),mipsel)
	APP_ARCH:=mipsel
endif
ifeq ($(ARCH),mips)
	APP_ARCH:=mips
endif
ifeq ($(ARCH),arm)
	APP_ARCH:=arm
endif
ifeq ($(BOARD),kirkwood)
	APP_ARCH:=arm
endif
ifeq ($(ARCH),armv7)
	APP_ARCH:=armv7
endif
ifeq ($(ARCH),aarch64)
	APP_ARCH:=aarch64
endif
ifeq ($(ARCH),arm64)
	APP_ARCH:=aarch64
endif
ifeq ($(ARCH),armv8)
	APP_ARCH:=aarch64
endif
ifeq ($(ARCH),x86_64)
	APP_ARCH:=x86_64
endif

RELEASE_REPO:=$(or $(EASYTIER_RELEASE_REPO),EasyTier/EasyTier)
RELEASE_TAG:=$(or $(EASYTIER_RELEASE_TAG),v$(PKG_VERSION))
RELEASE_ARCHIVE:=easytier-linux-$(APP_ARCH)-$(RELEASE_TAG).zip
RELEASE_URL:=https://github.com/$(RELEASE_REPO)/releases/download/$(RELEASE_TAG)/$(RELEASE_ARCHIVE)

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=net
	CATEGORY:=Network
	TITLE:=A simple, decentralized mesh VPN with WireGuard support.
	DEPENDS:=@(x86_64||arm||aarch64||mipsel||mips) +kmod-tun
	URL:=https://github.com/EasyTier/EasyTier
	MENU:=1
endef

define Package/$(PKG_NAME)/description
  A simple, decentralized mesh VPN with WireGuard support.
endef

define Package/$(PKG_NAME)/config
	config EASYTIER_INCLUDE_WEBCONSOLE
		bool "Include Web Console (easytier-web)"
		depends on PACKAGE_$(PKG_NAME)
		depends on !(mips || mipsel)
		default y
		help
		  Install the easytier-web web console.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	if [ ! -f $(PKG_BUILD_DIR)/easytier-core ]; then \
		echo "Downloading patched EasyTier from $(RELEASE_URL)"; \
		wget "$(RELEASE_URL)" -O $(PKG_BUILD_DIR)/$(RELEASE_ARCHIVE); \
		test -s $(PKG_BUILD_DIR)/$(RELEASE_ARCHIVE); \
		unzip -o -j $(PKG_BUILD_DIR)/$(RELEASE_ARCHIVE) -d $(PKG_BUILD_DIR); \
		rm -f $(PKG_BUILD_DIR)/$(RELEASE_ARCHIVE); \
		test -s $(PKG_BUILD_DIR)/easytier-core; \
		test -s $(PKG_BUILD_DIR)/easytier-cli; \
		if [ "$(CONFIG_EASYTIER_INCLUDE_WEBCONSOLE)" = "y" ]; then test -s $(PKG_BUILD_DIR)/easytier-web-embed; fi; \
	fi
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/easytier-core $(1)/usr/bin/easytier-core
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/easytier-cli $(1)/usr/bin/easytier-cli
ifdef CONFIG_EASYTIER_INCLUDE_WEBCONSOLE
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/easytier-web-embed $(1)/usr/bin/easytier-web
endif
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
