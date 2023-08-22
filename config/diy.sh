#!/bin/bash

# Default IP
sed -i 's/192.168.1.1/192.168.10.99/g' package/base-files/files/bin/config_generate

# Firewall
echo "iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE" >> package/network/config/firewall/files/firewall.user



# Add packages
svn co https://github.com/ophub/luci-app-amlogic/trunk package/amlogic
# svn co https://github.com/sbwml/luci-app-mosdns/trunk package/mosdns
echo 'src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2' >>feeds.conf.default
echo 'src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall.git;packages' >>feeds.conf.default
