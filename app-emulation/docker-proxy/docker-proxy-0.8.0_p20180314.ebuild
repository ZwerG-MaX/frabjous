# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGO_PN="github.com/docker/libnetwork"
GIT_COMMIT="1b91bc94094ecfdae41daa465cc0c8df37dfb3dd" #docker-18.04.0

inherit golang-vcs-snapshot

DESCRIPTION="Docker container networking"
HOMEPAGE="https://github.com/docker/libnetwork"
SRC_URI="https://${EGO_PN}/archive/${GIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm"
IUSE=""

DOCS=( {CHANGELOG,README,ROADMAP}.md )
QA_PRESTRIPPED="usr/bin/docker-proxy"

RESTRICT="test" # needs dockerd

G="${WORKDIR}/${P}"
S="${G}/src/${EGO_PN}"

src_compile() {
	export GOPATH="${G}"
	local mygoargs=(
		-v -work -x
		-buildmode=pie
		-asmflags "-trimpath=${S}"
		-gcflags "-trimpath=${S}"
		-ldflags "-s -w"
		-o docker-proxy
	)
	go build "${mygoargs[@]}" ./cmd/proxy || die
}

src_install() {
	dobin docker-proxy
	einstalldocs
}
