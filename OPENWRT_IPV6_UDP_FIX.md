# OpenWrt aarch64 IPv6 UDP/WireGuard fix

This repository uses a patched EasyTier build on **aarch64 OpenWrt** while the upstream IPv6 UDP reply-source bug is unresolved.

- Source repository: `ckbkdj/EasyTier`
- Fixed release: `v2.6.4-openwrt-ipv6fix.1`
- EasyTier base version: `v2.6.4`
- Affected path: UDP / WireGuard listeners on wildcard IPv6 sockets (`[::]`) on hosts with multiple IPv6 addresses.

## What is changed

1. `easytier` and `easytier-noweb` package builds use the fixed release only for `aarch64`; other architectures continue using the official EasyTier release.
2. The LuCI online downloader and the init-script emergency downloader use the same fixed release on aarch64.
3. The fix can be disabled with `openwrt_ipv6_udp_fix=0` in `/etc/config/easytier` or from LuCI Advanced Settings.
4. Online extraction accepts both the official release directory layout and the flat OpenWrt fix archive.

## Verification on OpenWrt

```sh
uci get easytier.@easytier[0].openwrt_ipv6_udp_fix
/usr/bin/easytier-core -V
netstat -lnptu | grep -E 'easytier|11010|1800|1804'
tcpdump -ni any -nn 'udp port 1800 or udp port 1804'
```

For a client packet sent to IPv6 address `A`, the server reply must also use IPv6 address `A` as its source instead of another local IPv6 address `B`.
