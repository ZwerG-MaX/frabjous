# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit golang-vcs-snapshot systemd user

GIT_COMMIT="98bc649"
EGO_PN="github.com/prometheus/${PN/prometheus-}"
DESCRIPTION="Prometheus exporter for hardware and OS metrics exposed by *NIX kernels"
HOMEPAGE="https://prometheus.io"
SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror strip"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DOCS=( {NOTICE,{CHANGELOG,README}.md} )

G="${WORKDIR}/${P}"
S="${G}/src/${EGO_PN}"

pkg_setup() {
	enewgroup node_exporter
	enewuser node_exporter -1 -1 -1 node_exporter
}

src_compile() {
	export GOPATH="${G}"
	local GOLDFLAGS="-s -w
		-X ${EGO_PN}/vendor/${EGO_PN%/*}/common/version.Version=${PV}
		-X ${EGO_PN}/vendor/${EGO_PN%/*}/common/version.Revision=${GIT_COMMIT}
		-X ${EGO_PN}/vendor/${EGO_PN%/*}/common/version.BuildUser=$(id -un)@$(hostname -f)
		-X ${EGO_PN}/vendor/${EGO_PN%/*}/common/version.Branch=non-git
		-X ${EGO_PN}/vendor/${EGO_PN%/*}/common/version.BuildDate=$(date -u '+%Y%m%d-%I:%M:%S')"

	go build -v -ldflags \
		"${GOLDFLAGS}" || die
}

src_test() {
	go test -v ./... || die
}

src_install() {
	dosbin node_exporter
	einstalldocs

	newinitd "${FILESDIR}"/${PN}.initd ${PN}
	newconfd "${FILESDIR}"/${PN}.confd ${PN}
	systemd_dounit "${FILESDIR}"/${PN}.service

	diropts -o node_exporter -g node_exporter -m 0750
	keepdir /var/{lib,log}/node_exporter
}
