#!/usr/bin/env bash
set -euo pipefail

# 下载到当前目录，路径结构：<host>/<path>
# 例如：cdn.jsdelivr.net/gh/.../Direct.png

urls=(
  "https://cdn.jsdelivr.net/gh/Koolson/Qure@master/IconSet/Color/Direct.png"
  "https://cdn.jsdelivr.net/gh/Koolson/Qure@master/IconSet/Color/Proxy.png"
  "https://cdn.jsdelivr.net/gh/shindgewongxj/WHATSINStash@master/icon/select.png"
  "https://cdn.jsdelivr.net/gh/Koolson/Qure@master/IconSet/Color/Auto.png"
  "https://cdn.jsdelivr.net/gh/Koolson/Qure@master/IconSet/Color/Singapore.png"
  "https://cdn.jsdelivr.net/gh/Koolson/Qure@master/IconSet/Color/Hong_Kong.png"
  "https://cdn.jsdelivr.net/gh/Koolson/Qure@master/IconSet/Color/United_States.png"
  "https://cdn.jsdelivr.net/gh/Koolson/Qure@master/IconSet/Color/Bot.png"
  "https://cdn.jsdelivr.net/gh/Koolson/Qure@master/IconSet/Color/Cryptocurrency_3.png"
  "https://cdn.jsdelivr.net/gh/Koolson/Qure@master/IconSet/Color/Telegram.png"
  "https://cdn.jsdelivr.net/gh/Koolson/Qure@master/IconSet/Color/Google_Search.png"
  "https://cdn.jsdelivr.net/gh/Koolson/Qure@master/IconSet/Color/YouTube.png"
  "https://cdn.jsdelivr.net/gh/Koolson/Qure@master/IconSet/Color/Netflix.png"
  "https://cdn.jsdelivr.net/gh/Koolson/Qure@master/IconSet/Color/Scholar.png"
  "https://cdn.jsdelivr.net/gh/Koolson/Qure@master/IconSet/Color/Game.png"
  "https://cdn.jsdelivr.net/gh/Koolson/Qure@master/IconSet/Color/Microsoft.png"
  "https://cdn.jsdelivr.net/gh/Koolson/Qure@master/IconSet/Color/Apple.png"
  "https://cdn.jsdelivr.net/gh/Koolson/Qure@master/IconSet/Color/Cloudflare.png"
  "https://cdn.jsdelivr.net/gh/Koolson/Qure@master/IconSet/Color/Steam.png"
  "https://cdn.jsdelivr.net/gh/Koolson/Qure@master/IconSet/Color/Final.png"

  "https://ruleset.skk.moe/Clash/non_ip/microsoft.txt"
  "https://ruleset.skk.moe/Clash/domainset/game-download.txt"
  "https://ruleset.skk.moe/Clash/domainset/cdn.txt"
  "https://ruleset.skk.moe/Clash/non_ip/cdn.txt"
  "https://ruleset.skk.moe/Clash/domainset/apple_cdn.txt"
  "https://ruleset.skk.moe/Clash/non_ip/microsoft_cdn.txt"
  "https://ruleset.skk.moe/Clash/non_ip/ai.txt"

  "https://cdn.jsdelivr.net/gh/powerfullz/override-rules@master/ruleset/SteamFix.list"
  "https://cdn.jsdelivr.net/gh/powerfullz/override-rules@master/ruleset/FirebaseCloudMessaging.list"
  "https://cdn.jsdelivr.net/gh/powerfullz/override-rules@master/ruleset/AdditionalFilter.list"

  "https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geoip.dat"
  "https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geosite.dat"
  "https://cdn.jsdelivr.net/gh/Loyalsoldier/geoip@release/Country.mmdb"
  "https://cdn.jsdelivr.net/gh/Loyalsoldier/geoip@release/GeoLite2-ASN.mmdb"
)

for url in "${urls[@]}"; do
  no_scheme="${url#https://}"
  no_scheme="${no_scheme#http://}"
  out_path="$PWD/$no_scheme"

  mkdir -p "$(dirname "$out_path")"
  echo "Downloading: $url"
  curl -fL --retry 3 --connect-timeout 15 --max-time 120 -o "$out_path" "$url"
done

echo "All files downloaded to current directory tree."
