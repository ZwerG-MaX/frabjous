## _Welcome to the Frabjous Gentoo overlay!_
![ebuilds 258](https://img.shields.io/badge/ebuilds-258-orange.svg?style=flat-square)
![GitHub repo size in bytes](https://img.shields.io/github/repo-size/csmk/frabjous.svg?style=flat-square)
[![Travis branch](https://img.shields.io/travis/csmk/frabjous/master.svg?style=flat-square)](https://travis-ci.org/csmk/frabjous)

This overlay contains many ebuilds for packages related to cryptography, system monitoring,
server-side applications and tools, web servers, and other things that I'm interested in.
It also include full support for `libressl` USE flag  and **_OpenRC!_**

**If you find any bugs, please report them!** I am also happy to accept pull requests from anyone.
You can use the [GitHub issue tracker](https://github.com/csmk/frabjous/issues) to report
bugs, ask questions or suggest new features.

**DISCLAIMER:** As I don't have the resources, nor the time to make stable ebuilds
in the same way Gentoo developers do, all ebuilds are permanently kept in the _testing
branch¹_. Thus, you should probably consider it to be _unsafe_ and treat it as such.
Nevertheless, I try my best to follow Gentoo's QA standards and keep everything up to date,
as I use many of these packages in a production environment.

> ¹ *If a package is in testing, it means that the developers feel that it is functional,
but has not been thoroughly tested. Users using the testing branch might very well be the
first to discover a bug in the package in which case they should file a bug report to let
the developers know about it.* —
[Gentoo's Handbook](https://wiki.gentoo.org/wiki/Handbook:AMD64/Full/Portage#Testing) ↩

## How to install the overlay
You can use it by adding this in `/etc/portage/repos.conf/frabjous.conf` (recommended):

```bash
sudo su -c "cat << EOF > /etc/portage/repos.conf/frabjous.conf
[frabjous]
priority = 50
location = /usr/local/overlay/frabjous
sync-type = git
sync-uri = https://github.com/csmk/frabjous.git
auto-sync = Yes
EOF"
```

Alternatively, for automatic install, you must have
[`app-eselect/eselect-repository`](https://packages.gentoo.org/packages/app-eselect/eselect-repository)
or [`app-portage/layman`](https://packages.gentoo.org/packages/app-portage/layman)
installed on your system for this to work.

#### With `eselect-repository`:
```console
eselect repository enable frabjous
```

#### With `layman`:
```console
layman -fa frabjous
```

> **Note:** To use the testing branch for particular packages, you must add the package
category and name (e.g., foo-bar/xyz) in `/etc/portage/package.accept_keywords`. It is
also possible to create a directory (with the same name) and list the package in the
files under that directory.

## Repository tree
This is a list of packages available and their associated description:

Package | Description
--- | ---
app-admin/**[consul](app-admin/consul)** | A tool for service discovery, monitoring and configuration
app-admin/**[doctl](app-admin/doctl)** | A command line tool for DigitalOcean services
app-admin/**[pick](app-admin/pick)** | A minimal password manager written in Go
app-admin/**[scaleway-cli](app-admin/scaleway-cli)** | Interact with Scaleway API from the command line
app-admin/**[terraform](app-admin/terraform)** | A tool for building, changing, and combining infrastructure safely/efficiently
app-admin/**[vault](app-admin/vault)** | A tool for managing secrets
app-arch/**[squash](app-arch/squash)** | Compression abstraction library and utilities
app-backup/**[restic](app-backup/restic)** | A backup program that is fast, efficient and secure
app-backup/**[zvault](app-backup/zvault)** | A highly efficient deduplicating backup solution
app-benchmarks/**[bombardier](app-benchmarks/bombardier)** | Fast cross-platform HTTP benchmarking tool written in Go
app-benchmarks/**[dnsperfbench](app-benchmarks/dnsperfbench)** | A command line tool to compare performance of DNS resolvers
app-benchmarks/**[hey](app-benchmarks/hey)** | HTTP load generator, ApacheBench (ab) replacement
app-benchmarks/**[pewpew](app-benchmarks/pewpew)** | Flexible HTTP command line stress tester for websites and web services
app-benchmarks/**[vegeta](app-benchmarks/vegeta)** | HTTP load testing tool and library. It's over 9000!
app-crypt/**[enchive](app-crypt/enchive)** | A tool to encrypt files to yourself for long-term archival
app-crypt/**[minisign](app-crypt/minisign)** | A dead simple tool to sign files and verify digital signatures
app-crypt/**[opmsg](app-crypt/opmsg)** | opmsg message encryption (an alternative to GnuPG)
app-crypt/**[ssh-vault](app-crypt/ssh-vault)** | Encrypt/Decrypt using SSH private keys
app-editors/**[micro](app-editors/micro)** | A modern and intuitive terminal-based text editor
app-misc/**[watchexec](app-misc/watchexec)** | Executes commands in response to file modifications
app-misc/**[watchman](app-misc/watchman)** | An inotify-based file watching and job triggering command line utility
app-shells/**[antibody](app-shells/antibody)** | The fastest shell plugin manager
app-shells/**[fzf](app-shells/fzf)** | A general-purpose command-line fuzzy finder
app-shells/**[peco](app-shells/peco)** | Simplistic interactive filtering tool
dev-db/**[influxdb](dev-db/influxdb)** | Scalable datastore for metrics, events, and real-time analytics
dev-db/**[pgweb](dev-db/pgweb)** | Web-based PostgreSQL database browser written in Go
dev-db/**[orchestrator](dev-db/orchestrator)** | A MySQL high availability and replication management tool
dev-db/**[tidb](dev-db/tidb)** | A distributed NewSQL database compatible with MySQL protocol
dev-go/**[depth](dev-go/depth)** | Retrieve and visualize Go source code dependency trees
dev-libs/**[libbaseencode](dev-libs/libbaseencode)** | Library written in C for encoding and decoding data using base32 or base64
dev-libs/**[libcotp](dev-libs/libcotp)** | C library that generates TOTP and HOTP
dev-libs/**[libmesode](dev-libs/libmesode)** | Fork of libstrophe for use with Profanity XMPP Client
dev-libs/**[libstrophe](dev-libs/libstrophe)** | A simple, lightweight C library for writing XMPP clients
dev-python/**[gmusicapi](dev-python/gmusicapi)** | An unofficial client library for Google Music
dev-python/**[gpsoauth](dev-python/gpsoauth)** | A python client library for Google Play Services OAuth
dev-python/**[proboscis](dev-python/proboscis)** | Extends Nose with certain TestNG like features
dev-python/**[pycryptodomex](dev-python/pycryptodomex)** | A self-contained (and independent) cryptographic library for Python
dev-python/**[validictory](dev-python/validictory)** | General purpose python data validator
dev-util/**[electron-bin](dev-util/electron-bin)** | Cross platform application development framework based on web technologies
dev-vcs/**[fossil](dev-vcs/fossil)** | Simple, high-reliability, source control management, and more
dev-vcs/**[gitkraken-bin](dev-vcs/gitkraken-bin)** | The intuitive, fast, and beautiful cross-platform Git client
dev-vcs/**[hub](dev-vcs/hub)** | A command-line wrapper for git that makes you better at GitHub
gnome-extra/**[gnome-pomodoro](gnome-extra/gnome-pomodoro)** | A Pomodoro timer for Gnome
gnome-extra/**[nautilus-git](gnome-extra/nautilus-git)** | Nautilus extension to add important information about the current git directory
mail-filter/**[rspamd](mail-filter/rspamd)** | Rapid spam filtering system
media-gfx/**[gifski](media-gfx/gifski)** | GIF encoder based on libimagequant
media-tv/**[tv-renamer](media-tv/tv-renamer)** | A TV series renaming application written in Rust
media-video/**[curlew](media-video/curlew)** | Easy to use and Free Multimedia Converter for Linux
media-video/**[gnome-mpv](media-video/gnome-mpv)** | A simple GTK+ frontend for mpv
media-video/**[peek](media-video/peek)** | Simple animated GIF screen recorder with an easy to use interface
net-analyzer/**[chronograf](net-analyzer/chronograf)** | Open source monitoring and visualization UI for the TICK stack
net-analyzer/**[goaccess](net-analyzer/goaccess)** | A real-time web log analyzer and interactive viewer that runs in a terminal
net-analyzer/**[kapacitor](net-analyzer/kapacitor)** | A framework for processing, monitoring, and alerting on time series data
net-analyzer/**[prometheus](net-analyzer/prometheus)** | The Prometheus monitoring system and time series database
net-analyzer/**prometheus-*** | Too many to list here; see [`net-analyzer`](net-analyzer) category, they're self-explanatory
net-analyzer/**[telegraf](net-analyzer/telegraf)** | An agent for collecting, processing, aggregating, and writing metrics
net-analyzer/**[wuzz](net-analyzer/wuzz)** | Interactive cli tool for HTTP inspection
net-dns/**[dnscrypt-proxy](net-dns/dnscrypt-proxy)** | A tool for securing communications between a client and a DNS resolver
net-dns/**[dnscrypt-wrapper](net-dns/dnscrypt-wrapper)** | A server-side DNSCrypt proxy
net-dns/**[knot-resolver](net-dns/knot-resolver)** | A caching full DNS resolver implementation written in C and LuaJIT
net-dns/**[knot](net-dns/knot)** | High-performance authoritative-only DNS server
net-dns/**[unbound](net-dns/unbound)** | A validating, recursive and caching DNS resolver
net-firewall/**[firehol](net-firewall/firehol)** | A firewall for humans...
net-im/**[dino](net-im/dino)** | A modern Jabber/XMPP Client using GTK+/Vala
net-im/**[profanity](net-im/profanity)** | A console based XMPP client inspired by Irssi
net-im/**[rambox-bin](net-im/rambox-bin)** | Free, Open Source and Cross Platform messaging and emailing app
net-libs/**[nodejs](net-libs/nodejs)** | A JavaScript runtime built on Chrome's V8 JavaScript engine
net-libs/**[wslay](net-libs/wslay)** | The WebSocket library written in C
net-misc/**[cointop](net-misc/cointop)** | A terminal based UI application for tracking cryptocurrencies
net-misc/**[electron-cash](net-misc/electron-cash)** | Lightweight Bitcoin Cash client
net-misc/**[gotty-client](net-misc/gotty-client)** | A terminal client for GoTTY
net-misc/**[pget](net-misc/pget)** | A parallel file download client in Go
net-misc/**[ssh-chat](net-misc/ssh-chat)** | A chat over SSH server written in Go
net-misc/**[piknik](net-misc/piknik)** | Copy/paste anything over the network
net-misc/**[tinyssh](net-misc/tinyssh)** | A small SSH server with state-of-the-art cryptography
net-news/**[feedreader](net-news/feedreader)** | A modern desktop application designed to complement web-based RSS accounts
net-p2p/**[Sia-UI](net-p2p/Sia-UI)** | The graphical front-end for Sia
net-p2p/**[Sia](net-p2p/Sia)** | Blockchain-based marketplace for file storage
net-p2p/**[bitcoin-abc](net-p2p/bitcoin-abc)** | A full node Bitcoin Cash implementation with GUI, daemon and utils
net-p2p/**[bitcoin-unlimited](net-p2p/bitcoin-unlimited)** | A full node Bitcoin implementation with GUI, daemon and utils
net-p2p/**[bitcoinxt](net-p2p/bitcoinxt)** | A full node Bitcoin Cash implementation with GUI, daemon and utils
net-p2p/**[bucash](net-p2p/bucash)** | A full node Bitcoin Cash implementation with GUI, daemon and utils
net-p2p/**[cloud-torrent](net-p2p/cloud-torrent)** | Cloud Torrent: a self-hosted remote torrent client
net-p2p/**[dash-core](net-p2p/dash-core)** | A peer-to-peer privacy-centric digital currency
net-p2p/**[drops](net-p2p/drops)** | A p2p transport network for opmsg end2end encrypted messages
net-p2p/**[parity](net-p2p/parity)** | Fast, light, and robust Ethereum client
net-p2p/**[go-ipfs](net-p2p/go-ipfs)** | IPFS implementation written in Go
net-p2p/**[monero](net-p2p/monero)** | The secure, private and untraceable cryptocurrency
net-p2p/**[monero-gui](net-p2p/monero-gui)** | The secure, private and untraceable cryptocurrency (with GUI wallet)
net-p2p/**[zcash](net-p2p/zcash)** | Cryptocurrency that offers privacy of transactions
net-proxy/**[ergo](net-proxy/ergo)** | The reverse proxy agent for local domain management
net-proxy/**[fabio](net-proxy/fabio)** | A load balancing and TCP router for deploying applications managed by consul
net-proxy/**[shadowsocks2](net-proxy/shadowsocks2)** | A fresh implementation of Shadowsocks in Go
net-proxy/**[shadowsocks-go](net-proxy/shadowsocks-go)** | A Go port of Shadowsocks
net-proxy/**[shadowsocks-rust](net-proxy/shadowsocks-rust)** | A Rust port of Shadowsocks
net-proxy/**[toxiproxy](net-proxy/toxiproxy)** | A TCP proxy to simulate network and system conditions
net-proxy/**[traefik](net-proxy/traefik)** | A modern HTTP reverse proxy and load balancer made to deploy microservices
net-vpn/**[onioncat](net-vpn/onioncat)** | An IP-Transparent Tor Hidden Service Connector
net-vpn/**[vpncloud](net-vpn/vpncloud)** | A fully-meshed VPN network in a peer-to-peer manner
sys-apps/**[bat](sys-apps/bat)** | A 'cat' clone with syntax highlighting and Git integration
sys-apps/**[exa](sys-apps/exa)** | A replacement for 'ls' written in Rust
sys-apps/**[fd](sys-apps/fd)** | A simple, fast and user-friendly alternative to 'find'
sys-apps/**[yarn](sys-apps/yarn)** | Fast, reliable, and secure node dependency management
sys-auth/**[otpclient](sys-auth/otpclient)** | Simple GTK+ 3 OTP client (TOTP and HOTP)
sys-auth/**[pam_u2f](sys-auth/pam_u2f)** | Library for authenticating against PAM with a Yubikey
sys-auth/**[yubikey-touch-detector](sys-auth/yubikey-touch-detector)** | A tool that can detect when your YubiKey is waiting for a touch
sys-fs/**[gocryptfs](sys-fs/gocryptfs)** | Encrypted overlay filesystem written in Go
sys-fs/**[tmsu](sys-fs/tmsu)** | Files tagger and virtual tag-based filesystem
sys-process/**[gkill](sys-process/gkill)** | An interactive process killer
www-apps/**[cryptpad](www-apps/cryptpad)** | The zero knowledge realtime collaborative editor
www-apps/**[filebrowser](www-apps/filebrowser)** | A stylish web file manager
www-apps/**[gitea](www-apps/gitea)** | Gitea - Git with a cup of tea
www-apps/**[gogs](www-apps/gogs)** | A painless self-hosted Git service
www-apps/**[gotty](www-apps/gotty)** | A simple command line tool that turns your CLI tools into web applications
www-apps/**[grafana](www-apps/grafana)** | Grafana is an open source metric analytics & visualization suite
www-apps/**[hiawatha-monitor](www-apps/hiawatha-monitor)** | Monitoring application for www-servers/hiawatha
www-apps/**[hugo](www-apps/hugo)** | A static HTML and CSS website generator written in Go
www-apps/**[mattermost-server](www-apps/mattermost-server)** | Open source Slack-alternative in Golang and React
www-apps/**[rocketchat-server](www-apps/rocketchat-server)** | A Web Chat Server developed in JavaScript, using the Meteor framework
www-client/**[inox](www-client/inox)** | Chromium spin-off to enhance privacy by disabling data transmission to Google
www-plugins/**[browserpass](www-plugins/browserpass)** | WebExtension host binary for app-admin/pass, a UNIX password manager
www-servers/**[algernon](www-servers/algernon)** | Pure Go web server with Lua, Markdown, QUIC and Pongo2 support
www-servers/**[caddy](www-servers/caddy)** | Fast, cross-platform HTTP/2 web server with automatic HTTPS
www-servers/**[h2o](www-servers/h2o)** | An optimized HTTP server with support for HTTP/1.x and HTTP/2
www-servers/**[hiawatha](www-servers/hiawatha)** | Advanced and secure webserver
www-servers/**[nginx](www-servers/nginx)** | Robust, small and high performance http and reverse proxy server
www-servers/**[rest-server](www-servers/rest-server)** | A high performance HTTP server that implements restic's REST backend API
x11-misc/**[noti](x11-misc/noti)** | Trigger notifications when a process completes

* All commits are signed with the key ID: `A6C7CA717170C3FD`
* Fingerprint: [`10E4 B84B FAB9 3923 F181 695F B0E3 361B A998 2E58`](https://keybase.io/csmk/pgp_keys.asc)

## Donations are welcome!
If you are into cryptocurrencies and appreciates the work done here, please consider to buy me a cup of _coffee_.
* Bitcoin _Cash_: `qpgh64feure4a42073wxz3v867t45ht3csxlsx693d`
* Dash: `Xg8AVx7YLSpTagR5DSzHk9Na1oDMUwb2hk`
* Ether: `0x002e7A11013BF05D418FD3FbdA4f3381E82e5A23`
* Zcash: `zcX1qbN2YJKARPmFcrU3HgpQfYbWe9yy4YsogDA4gpwJ6NGk2bXZ6nyNDo3HLBkAKizRPkASSEduGeVtzj3VfixFey9y1Yx`
* Monero: ↴

`4KseVC8hDgP27ata3RuhyFbr1YMYn24hKDQixKTiQTufGX6Fn9vYTsvNY3uaZwivEQXXeewBk6d8eFymEGCU8pArN5m8JxkAcAu5CQRwat`

