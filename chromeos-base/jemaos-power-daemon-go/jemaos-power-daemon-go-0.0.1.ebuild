# Copyright (c) 2022 Jema Innovations Limited and the openJema Authors.
# Distributed under the license specified in the root directory of this project.

EAPI="6"


EGIT_REPO_URI="${JEMAOS_GIT_HOST_URL}/jemaos-power-daemon-go.git"
EGIT_BRANCH="main"

inherit git-r3 golang-build
DESCRIPTION="jemaos power daemon in golang"
HOMEPAGE="http://jemaos.com"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="amd64 arm arm64"
IUSE=""

RDEPEND="
  "

DEPEND="${RDEPEND}
  dev-lang/go
  dev-go/dbus
"

EGO_PN="jemaos.com/power_daemon"


src_compile() {
   export GO111MODULE=auto
   GOARCH=$ARCH golang-build_src_compile
}
get_golibdir() {
  echo "/usr/lib/gopath"
}

src_install() {
  insinto /etc/init
  doins init/jemaos-power-daemon.conf
  exeinto /etc/powerd
  doexe init/post_resume.sh
  doexe init/pre_suspend.sh
  keepdir /etc/powerd/board
  exeinto /usr/sbin
  doexe power_daemon
}
