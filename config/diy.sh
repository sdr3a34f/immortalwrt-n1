#!/bin/bash

# Default IP
# sed -i 's/192.168.1.1/192.168.10.99/g' package/base-files/files/bin/config_generate

# Firewall
echo "iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE" >> package/network/config/firewall/files/firewall.user


# Add packages
svn co https://github.com/ophub/luci-app-amlogic/trunk package/amlogic
# svn co https://github.com/sbwml/luci-app-mosdns/trunk package/mosdns

# Remove packages
rm -rf feeds/luci/applications/luci-app-passwall
rm -rf feeds/packages/net/haproxy
rm -rf feeds/packages/net/v2ray-geodata

# passwall
# git clone https://github.com/xiaorouji/openwrt-passwall.git -b packages package/passwall_package
# git clone https://github.com/xiaorouji/openwrt-passwall2.git package/passwall2
# git clone -b packages --depth=1 https://github.com/xiaorouji/openwrt-passwall.git package/openwrt-passwall
# git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall2.git package/openwrt-passwall2
svn co https://github.com/nantayo/my-pkg/trunk package/my-pkg
