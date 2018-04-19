# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit golang-vcs-snapshot user

GIT_COMMIT="3a57610"
EGO_PN="github.com/github/${PN}"
DESCRIPTION="A MySQL high availability and replication management tool"
HOMEPAGE="https://github.com/github/orchestrator"
SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror strip"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="virtual/mysql"

G="${WORKDIR}/${P}"
S="${G}/src/${EGO_PN}"

pkg_setup() {
	enewgroup orchestrator
	enewuser orchestrator -1 -1 -1 orchestrator
}

src_compile() {
	export GOPATH="${G}"
	local GOLDFLAGS="-s -w \
		-X main.AppVersion=${PV} \
		-X main.GitCommit=${GIT_COMMIT}"

	go build -v -ldflags "${GOLDFLAGS}" -o \
		./orchestrator go/cmd/orchestrator/main.go || die
}

src_install() {
	exeinto /usr/libexec/orchestrator
	doexe orchestrator

	newinitd "${FILESDIR}"/${PN}.initd ${PN}

	insinto /etc/orchestrator
	doins conf/orchestrator-*.conf.json

	insinto /usr/share/orchestrator
	doins -r resources

	dosym ../../share/orchestrator/resources \
		/usr/libexec/orchestrator/resources

	diropts -m 0750 -o orchestrator -g orchestrator
	dodir /var/log/orchestrator
}
