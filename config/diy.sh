#!/bin/bash

# Default IP
# sed -i 's/192.168.1.1/192.168.10.99/g' package/base-files/files/bin/config_generate

# Firewall
echo "iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE" >> package/network/config/firewall/files/firewall.user

# geodata
wget -q -cP files/usr/share/v2ray https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat
wget -q -cP files/usr/share/v2ray https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat

# Add packages
svn co https://github.com/ophub/luci-app-amlogic/trunk package/amlogic
# svn co https://github.com/sbwml/luci-app-mosdns/trunk package/mosdns

# passwall2
# git clone https://github.com/xiaorouji/openwrt-passwall.git -b packages package/passwall_package
# git clone https://github.com/xiaorouji/openwrt-passwall2.git package/passwall2
# git clone -b packages --depth=1 https://github.com/xiaorouji/openwrt-passwall.git package/openwrt-passwall
# git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall2.git package/openwrt-passwall2
# svn co https://github.com/nantayo/my-pkg/trunk package/my-pkg
echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> "feeds.conf.default"
echo "src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git;main" >> "feeds.conf.default"
