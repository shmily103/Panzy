#
# Copyright (C) 2016-2017 GitHub 
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=default-settings
PKG_VERSION:=2
PKG_RELEASE:=23
PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk

define Package/default-settings
  SECTION:=luci
  CATEGORY:=LuCI
  TITLE:=LuCI support for Default Settings
  PKGARCH:=all
  DEPENDS:=+luci-base +luci +@LUCI_LANG_zh_Hans +kmod-usb-ohci +kmod-usb-uhci +kmod-usb-storage +kmod-usb-storage-extras +cfdisk \
	+kmod-usb2 +kmod-usb3 +block-mount +badblocks +kmod-fs-ext4 +kmod-fs-vfat +kmod-nls-utf8 +fdisk +usbutils +ntfs-3g +luci-compat\
	+luci-theme-material +luci-app-aria2 +ariang +luci-app-samba4 +luci-app-ramfree +wireless-tools +wireless-regdb
endef

$(eval $(call BuildPackage,default-settings))
