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

	wget https://raw.githubusercontent.com/listen1/listen1_desktop/master/app/resources/logo.png -O logo.png
	cat > listen1.desktop << "EOF"
[Desktop Entry]
Name=Listen1
Comment=One for all free music in China
Exec=env DESKTOPINTEGRATION=no "/opt/listen1/listen1_2.21.6_linux_x86_64.AppImage" %U
Terminal=false
Type=Application
Icon=/opt/listen1/icons/listen1.png
StartupWMClass=listen1
X-AppImage-Version=2.21.6
Categories=Categories=Music;AudioVideo;Player;
EOF
	insinto /usr/share/applications/
	doins listen1.desktop
}
