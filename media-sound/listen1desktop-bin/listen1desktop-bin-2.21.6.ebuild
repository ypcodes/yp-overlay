# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="one for all free music in china (Windows, Mac, Linux desktop)"
HOMEPAGE="https://listen1.github.io/listen1"
SRC_URI="https://github.com/listen1/listen1_desktop/releases/download/v${PV}/listen1_${PV}_linux_x86_64.AppImage"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

src_unpack() {
	mkdir listen1desktop-bin-${PV}
}

src_prepare() {
	default
	cp ../../distdir/listen1_${PV}_linux_x86_64.AppImage .
}

src_install() {
	exeinto /opt/listen1
	doexe listen1_${PV}_linux_x86_64.AppImage
	dosym /opt/listen1/listen1_${PV}_linux_x86_64.AppImage /usr/bin/listen1
}
