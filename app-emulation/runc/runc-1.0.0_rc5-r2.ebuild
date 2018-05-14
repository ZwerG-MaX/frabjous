# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGO_PN="github.com/opencontainers/${PN}"
EGO_VENDOR=( "github.com/cpuguy83/go-md2man 20f5889" )
GIT_COMMIT="4fc53a8" # Change this when you update the ebuild

inherit bash-completion-r1 golang-vcs-snapshot

DESCRIPTION="CLI tool for spawning and running containers"
HOMEPAGE="http://runc.io"
SRC_URI="https://${EGO_PN}/archive/v${PV/_/-}.tar.gz -> ${P}.tar.gz
	${EGO_VENDOR_URI}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm"
IUSE="+ambient apparmor bash-completion +seccomp"

RDEPEND="!app-emulation/docker-runc
	apparmor? ( sys-libs/libapparmor )
	seccomp? ( sys-libs/libseccomp )"

DOCS=( {PRINCIPLES,README}.md )
QA_PRESTRIPPED="usr/bin/runc"

RESTRICT="test" # needs dockerd

G="${WORKDIR}/${P}"
S="${G}/src/${EGO_PN}"

src_compile() {
	export GOPATH="${G}"
	# Taken from app-emulation/docker-1.7.0-r1
	export CGO_CFLAGS="-I${ROOT}/usr/include"
	export CGO_LDFLAGS="-L${ROOT}/usr/$(get_libdir)"

	local PATH="${G}/bin:$PATH"
	ebegin "Building go-md2man locally"
	pushd vendor/github.com/cpuguy83/go-md2man > /dev/null || die
	go build -v -ldflags "-s -w" -o \
		"${G}"/bin/go-md2man || die
	popd > /dev/null || die
	eend $?

	# build up optional flags
	local options=(
		$(usex ambient ambient '')
		$(usex apparmor apparmor '')
		$(usex seccomp seccomp '')
	)

	local mygoargs=(
		-v -work -x
		-buildmode=pie
		-asmflags "-trimpath=${S}"
		-gcflags "-trimpath=${S}"
		-ldflags "-s -w
			-X main.gitCommit=${GIT_COMMIT}
			-X main.version=${PV/_/-}"
		-tags "${options[*]}"
	)
	go build "${mygoargs[@]}" || die

	./man/md2man-all.sh || die
}

src_install() {
	dobin runc
	einstalldocs

	doman man/man8/*

	use bash-completion && \
		dobashcomp contrib/completions/bash/runc
}
