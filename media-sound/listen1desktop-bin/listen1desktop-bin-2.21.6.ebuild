# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="one for all free music in china (Windows, Mac, Linux desktop)"
HOMEPAGE="https://listen1.github.io/listen1"
SRC_URI="https://github.com/listen1/listen1_desktop/releases/download/v${PV}/listen1_${PV}_linux_x86_64.AppImage"

LICENSE="MIT"
SLOT="2/21.6"
KEYWORDS="~amd64"

src_unpack() {
	mkdir listen1desktop-bin-${PV}
}

src_install() {
	# create Makefile
	cat > Makefile << "EOF"
DEST ?= /usr/bin

install:
		@mkdir -p $(DESTDIR)/$(DEST)
		@cp ../../distdir/listen1_${PV}_linux_x86_64.AppImage $(DESTDIR)/$(DEST)/listen1
		@chmod 755 $(DESTDIR)/$(DEST)/listen1
		@echo Listen1 has been installed on your device

uninstall:
		@rm -rf $(DEST)/listen1
		@echo Listen1 has been removed from your device
EOF
	# Install
	emake DESTDIR="${D}" PREFIX=/usr install
}
