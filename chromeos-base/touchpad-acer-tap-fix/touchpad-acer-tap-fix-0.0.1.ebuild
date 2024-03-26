# Copyright (c) 2023 Jema Technology .
# Distributed under the license specified in the root directory of this project.

EAPI="5"

DESCRIPTION="empty project"
HOMEPAGE="http://jemakey.com"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND=""

DEPEND="${RDEPEND}"
S=$WORKDIR

src_install() {
   insinto /etc/gesture
   doins ${FILESDIR}/50-touchpad-snya.conf    
}
