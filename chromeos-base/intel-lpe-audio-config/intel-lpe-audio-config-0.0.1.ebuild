# Copyright (c) 2023 Jema Technology .
# Distributed under the license specified in the root directory of this project.

EAPI="5"

DESCRIPTION="All chromebook sound ucm config files"
HOMEPAGE="http://jemakey.com"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND=""

DEPEND="${RDEPEND}"

S=${WORKDIR}

src_install() {
    insinto /usr/share/alsa/ucm
    doins -r ${FILESDIR}/ucm-config/*
}
