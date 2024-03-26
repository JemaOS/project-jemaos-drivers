# Copyright (c) 2022 Jema Innovations Limited and the openJema Authors.
# Distributed under the license specified in the root directory of this project.

EAPI="6"

CROS_WORKON_PROJECT="chromiumos/third_party/jemaos-power-daemon"
#CROS_WORKON_LOCALNAME="jemaos-power-daemon"

inherit cros-workon golang-build
DESCRIPTION="jemaos power daemon in golang"
HOMEPAGE="http://jemaos.com"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="~*"
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
  insinto /etc/powerd
  doins init/post_resume.sh
  doins init/pre_suspend.sh
  keepdir /etc/powerd/board
  exeinto /usr/sbin
  doexe power_daemon
}
