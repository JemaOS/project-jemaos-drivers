# Copyright (c) 2023 Jema Technology .
# Distributed under the license specified in the root directory of this project.

EAPI="7"
inherit arc-camera
DESCRIPTION="support most of usb-cameras"
HOMEPAGE="http://jemakey.com"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"
IUSE="jemaos_arc android-container-pi"

RDEPEND=""

DEPEND="${RDEPEND}"
S=${WORKDIR}

src_install() {
    insinto /etc/camera
    if ! use android-container-pi;then
        doins ${FILESDIR}/camera_characteristics.conf
        use jemaos_arc && arc-camera_gen_and_install_rules
    fi
}
