#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================
#add packages
git clone https://github.com/shmily103/Panzy.git package/Panzy

# Modify default IP
sed -i 's/192.168.1.1/192.168.6.1/g' package/base-files/files/bin/config_generate
# Modify WiFi ON
sed -i 's/disabled=1/disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
# Modify default SSID
sed -i 's/ssid=OpenWrt/ssid=Panzy/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
# Modify Automount
\cp -rf package/Panzy/mount.hotplug package/system/fstools/files

mkdir -p files/etc/uci-defaults
\cp -rf package/Panzy/config/99-custom-wifi files/etc/uci-defaults
chmod +x files/etc/uci-defaults/99-custom-wifi

# Add tools
#mv package/Panzy/upx tools/upx
#mv package/Panzy/ucl tools/ucl

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
sed -i 's/OpenWrt/Panzy/g' package/base-files/files/bin/config_generate

# Modify LAN port
sed -i 's/eth0/eth1/g' package/base-files/files/etc/board.d/99-default_network

# 强制将 Rust Makefile 中的 download-ci-llvm=true 改为 if-unchanged
# sed -i 's/--set=llvm.download-ci-llvm=true/--set=llvm.download-ci-llvm=if-unchanged/g' feeds/packages/lang/rust/Makefile

# Fix permission
#chmod a+x -R package/Panzy

# Fix aria2
# sed -i 's/procd_add_jail_mount "$config_file"/procd_add_jail_mount "$ca_certificate" "$certificate" "$rpc_certificate" "$rpc_private_key"/g' feeds/packages/net/aria2/files/aria2.init

# fix unblockmusic
# chmod a+x package/Panzy/luci-app-unblockneteasemusic/root/etc/init.d/unblockneteasemusic
# rm -rf package/feeds/packages/kcptun
# update Go
# rm -rf feeds/packages/lang/golang
# rm -rf package/feeds/packages/golang
# cp -rf package/Panzy/golang feeds/packages/lang/golang
# rm -rf package/Panzy/golang
